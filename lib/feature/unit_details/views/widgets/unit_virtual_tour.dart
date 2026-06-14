import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/feature/unit_details/models/unit_details_model.dart';
import 'package:propix8/feature/unit_details/viewmodels/unit_details_cubit.dart';
import 'package:propix8/feature/unit_details/viewmodels/unit_details_state.dart';
import 'package:propix8/feature/unit_details/views/widgets/section_header.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class UnitVirtualTour extends StatefulWidget {
  const UnitVirtualTour({super.key});

  @override
  State<UnitVirtualTour> createState() => _UnitVirtualTourState();
}

class _UnitVirtualTourState extends State<UnitVirtualTour> {
  // Use Maps to store multiple video controllers
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

  // Memory management: dispose controllers outside the range (current - 1) to (current + 1)
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

  Future<void> _initializeVideoAtIndex(
    int index,
    List<MediaModel> videos,
  ) async {
    // Validate index bounds
    if (index < 0 || index >= videos.length) return;

    // Skip if video is already initialized
    if (_videoControllers.containsKey(index)) return;

    final url = _getVideoUrl(videos[index]);
    final controller = VideoPlayerController.networkUrl(Uri.parse(url));

    // Register in the map immediately to prevent duplicate initialization
    _videoControllers[index] = controller;

    try {
      await controller.initialize();

      if (_isDisposed) {
        await controller.dispose();
        return;
      }

      if (mounted) {
        setState(() {
          _chewieControllers[index] = ChewieController(
            videoPlayerController: controller,
            aspectRatio: controller.value.aspectRatio,
            placeholder: Container(color: Colors.black), // Prevents flicker
            errorBuilder: (context, errorMessage) => Center(
              child: Text(
                errorMessage,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        });
      }
    } on Object catch (e) {
      debugPrint('Error initializing video $index: $e');
      _videoControllers.remove(index);
    }
  }

  void _handlePageChanged(int index, List<MediaModel> videos) {
    if (_currentIndex == index) return;

    // 1. Pause the previous video
    unawaited(_chewieControllers[_currentIndex]?.pause());

    setState(() {
      _currentIndex = index;
    });

    // 2. Ensure current video is initialized (re-initialize if it was disposed)
    unawaited(_initializeVideoAtIndex(index, videos));

    // 3. Preload next video (forward)
    if (index + 1 < videos.length) {
      unawaited(_initializeVideoAtIndex(index + 1, videos));
    }

    // 4. Preload previous video (backward) — fixes back-navigation lag
    if (index - 1 >= 0) {
      unawaited(_initializeVideoAtIndex(index - 1, videos));
    }

    // 5. Clean up memory
    _manageMemory(index);
  }

  void _handleVisibilityChanged(VisibilityInfo info) {
    // Pause the current video when the widget goes off-screen
    if (info.visibleFraction < 0.1) {
      unawaited(_chewieControllers[_currentIndex]?.pause());
    }
  }

  String _getVideoUrl(MediaModel video) =>
      video.hlsPath.isNotEmpty ? video.hlsPath : video.filePath;

  @override
  Widget build(BuildContext context) =>
      BlocSelector<UnitDetailsCubit, UnitDetailsState, List<MediaModel>>(
        selector: (state) =>
            state.unit?.media.where((m) => m.type == 'video').toList() ?? [],
        builder: (context, videos) {
          if (videos.isEmpty) {
            return const SliverToBoxAdapter(child: SizedBox());
          }

          // First build only: initialize the first and second videos
          if (_videoControllers.isEmpty && videos.isNotEmpty) {
            unawaited(_initializeVideoAtIndex(0, videos));
            if (videos.length > 1) unawaited(_initializeVideoAtIndex(1, videos));
          }

          return SliverToBoxAdapter(
            child: VisibilityDetector(
              key: const Key('unit-virtual-tour-video'),
              onVisibilityChanged: _handleVisibilityChanged,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(title: context.l10n.virtualTour),
                  SizedBox(height: 8.h),
                  _VideoCarousel(
                    videos: videos,
                    chewieControllers: _chewieControllers,
                    videoControllers: _videoControllers,
                    onPageChanged: (index) => _handlePageChanged(index, videos),
                  ),
                ],
              ),
            ),
          );
        },
      );
}

class _VideoCarousel extends StatefulWidget {
  const _VideoCarousel({
    required this.videos,
    required this.chewieControllers,
    required this.videoControllers,
    required this.onPageChanged,
  });

  final List<MediaModel> videos;
  final Map<int, ChewieController> chewieControllers;
  final Map<int, VideoPlayerController> videoControllers;
  final ValueChanged<int> onPageChanged;

  @override
  State<_VideoCarousel> createState() => _VideoCarouselState();
}

class _VideoCarouselState extends State<_VideoCarousel> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      SizedBox(
        height: 200.h,
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentPage = index);
            widget.onPageChanged(index);
          },
          itemCount: widget.videos.length,
          itemBuilder: (context, index) {
            final chewieController = widget.chewieControllers[index];
            final isInitialized =
                widget.videoControllers[index]?.value.isInitialized ?? false;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: isInitialized && chewieController != null
                    ? Chewie(controller: chewieController)
                    : const ColoredBox(
                        color: Colors.black,
                        child: Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                      ),
              ),
            );
          },
        ),
      ),
      if (widget.videos.length > 1) ...[
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.videos.length, (index) {
            final isActive = _currentPage == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isActive ? 24.w : 8.w,
              height: 4.h,
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              decoration: BoxDecoration(
                color: context.colorScheme.primary.withValues(
                  alpha: isActive ? 0.9 : 0.2,
                ),
                borderRadius: BorderRadius.circular(isActive ? 6.r : 50.r),
              ),
            );
          }),
        ),
      ],
    ],
  );
}
