import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_details_entity.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_bloc.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_state.dart';
import 'package:propix8/feature/unit_details/presentation/widgets/section_header.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class UnitVirtualTour extends StatefulWidget {
  const UnitVirtualTour({super.key});

  @override
  State<UnitVirtualTour> createState() => _UnitVirtualTourState();
}

class _UnitVirtualTourState extends State<UnitVirtualTour> {
  final Map<int, VideoPlayerController> _videoControllers = {};
  final Map<int, ChewieController> _chewieControllers = {};

  int _currentIndex = 0;
  bool _isDisposed = false;

  @override
  void dispose() {
    _isDisposed = true;
    _disposeAllControllers();
    super.dispose();
  }

  void _disposeAllControllers() {
    for (final controller in _chewieControllers.values) {
      controller.dispose();
    }
    for (final controller in _videoControllers.values) {
      unawaited(controller.dispose());
    }
    _chewieControllers.clear();
    _videoControllers.clear();
  }

  void _manageMemory(int currentIndex) {
    final keys = List<int>.from(_videoControllers.keys);
    for (final index in keys) {
      if (index < currentIndex - 1 || index > currentIndex + 1) {
        _chewieControllers[index]?.dispose();
        unawaited(_videoControllers[index]?.dispose() ?? Future.value());
        _chewieControllers.remove(index);
        _videoControllers.remove(index);
      }
    }
  }

  Future<void> _initializeVideo(int index, String videoUrl) async {
    if (_videoControllers.containsKey(index) || _isDisposed) return;

    try {
      final videoController =
          VideoPlayerController.networkUrl(Uri.parse(videoUrl));
      _videoControllers[index] = videoController;

      await videoController.initialize();

      if (_isDisposed) {
        unawaited(videoController.dispose());
        return;
      }

      final chewieController = ChewieController(
        videoPlayerController: videoController,
        aspectRatio: videoController.value.aspectRatio,
        placeholder: const ColoredBox(
          color: Colors.black,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );

      if (!_isDisposed) {
        _chewieControllers[index] = chewieController;
        if (mounted) setState(() {});
      } else {
        chewieController.dispose();
        unawaited(videoController.dispose());
      }
    } on Object catch (_) {}
  }

  @override
  Widget build(BuildContext context) =>
      BlocSelector<UnitDetailsBloc, UnitDetailsState, List<UnitMediaEntity>>(
        selector: (state) =>
            state.unit?.media.where((m) => m.type == 'video').toList() ?? [],
        builder: (context, videos) {
          if (videos.isEmpty) {
            return const SliverToBoxAdapter(child: SizedBox());
          }

          final currentVideo = videos[_currentIndex];
          final videoUrl = currentVideo.hlsPath.isNotEmpty
              ? currentVideo.hlsPath
              : currentVideo.filePath;

          if (!_videoControllers.containsKey(_currentIndex) &&
              videoUrl.isNotEmpty) {
            unawaited(_initializeVideo(_currentIndex, videoUrl));
          }

          final chewieController = _chewieControllers[_currentIndex];

          return SliverToBoxAdapter(
            child: VisibilityDetector(
              key: const Key('unit-virtual-tour-video'),
              onVisibilityChanged: (info) {
                if (info.visibleFraction < 0.5) {
                  unawaited(_chewieControllers[_currentIndex]?.pause());
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(title: context.l10n.virtualTour),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Container(
                      height: 220.h,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          if (chewieController != null &&
                              chewieController
                                  .videoPlayerController.value.isInitialized)
                            Chewie(controller: chewieController)
                          else
                            const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          if (videos.length > 1) ...[
                            if (_currentIndex > 0)
                              PositionedDirectional(
                                start: 8.w,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _currentIndex--;
                                      _manageMemory(_currentIndex);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            if (_currentIndex < videos.length - 1)
                              PositionedDirectional(
                                end: 8.w,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _currentIndex++;
                                      _manageMemory(_currentIndex);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
