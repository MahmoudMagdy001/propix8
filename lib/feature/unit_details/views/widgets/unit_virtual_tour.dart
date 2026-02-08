import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../models/unit_details_model.dart';
import '../../viewmodels/unit_details_cubit.dart';
import '../../viewmodels/unit_details_state.dart';

class UnitVirtualTour extends StatefulWidget {
  const UnitVirtualTour({super.key});

  @override
  State<UnitVirtualTour> createState() => _UnitVirtualTourState();
}

class _UnitVirtualTourState extends State<UnitVirtualTour> {
  // استخدام Map لتخزين المتحكمات المتعددة
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
    for (var controller in _chewieControllers.values) {
      controller.dispose();
    }
    for (var controller in _videoControllers.values) {
      controller.dispose();
    }
    _chewieControllers.clear();
    _videoControllers.clear();
  }

  // إدارة الذاكرة: تحذف أي فيديو بعيد عن النطاق (الحالي - 1) و (الحالي + 1)
  void _manageMemory(int currentIndex) {
    final keys = List<int>.from(_videoControllers.keys);
    for (var index in keys) {
      if (index < currentIndex - 1 || index > currentIndex + 1) {
        _chewieControllers[index]?.dispose();
        _videoControllers[index]?.dispose();
        _chewieControllers.remove(index);
        _videoControllers.remove(index);
      }
    }
  }

  Future<void> _initializeVideoAtIndex(
    int index,
    List<MediaModel> videos,
  ) async {
    // التحقق من صحة الإندكس
    if (index < 0 || index >= videos.length) return;

    // لو الفيديو موجود بالفعل، لا تعد تحميله
    if (_videoControllers.containsKey(index)) return;

    final url = _getVideoUrl(videos[index]);
    final controller = VideoPlayerController.networkUrl(Uri.parse(url));

    // تسجيله في الماب فوراً لمنع التكرار
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
            placeholder: Container(color: Colors.black), // يمنع الوميض
            errorBuilder: (context, errorMessage) => Center(
              child: Text(
                errorMessage,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        });
      }
    } catch (e) {
      debugPrint('Error initializing video $index: $e');
      _videoControllers.remove(index);
    }
  }

  void _handlePageChanged(int index, List<MediaModel> videos) {
    if (_currentIndex == index) return;

    // 1. إيقاف الفيديو القديم
    _chewieControllers[_currentIndex]?.pause();

    setState(() {
      _currentIndex = index;
    });

    // 2. أهم خطوة: التأكد من وجود الفيديو الحالي (لو كان محذوف يحمله تاني)
    _initializeVideoAtIndex(index, videos);

    // 3. Preload للفيديو القادم (Forward)
    if (index + 1 < videos.length) {
      _initializeVideoAtIndex(index + 1, videos);
    }

    // 4. Preload للفيديو السابق (Backward) - ده اللي بيحل مشكلة الرجوع
    if (index - 1 >= 0) {
      _initializeVideoAtIndex(index - 1, videos);
    }

    // 5. تنظيف الذاكرة
    _manageMemory(index);
  }

  void _handleVisibilityChanged(VisibilityInfo info) {
    // لو الودجت اختفت من الشاشة، وقف الفيديو الحالي
    if (info.visibleFraction < 0.1) {
      _chewieControllers[_currentIndex]?.pause();
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

          // عند أول بناء فقط: حمل أول فيديو وتاني فيديو
          if (_videoControllers.isEmpty && videos.isNotEmpty) {
            _initializeVideoAtIndex(0, videos);
            if (videos.length > 1) _initializeVideoAtIndex(1, videos);
          }

          return SliverToBoxAdapter(
            child: VisibilityDetector(
              key: const Key('unit-virtual-tour-video'),
              onVisibilityChanged: _handleVisibilityChanged,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      context.l10n.virtualTour,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ),
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
                    : Container(
                        color: Colors.black,
                        child: const Center(
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
