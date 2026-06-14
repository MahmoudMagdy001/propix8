import 'dart:async';
import 'package:flutter/widgets.dart';

mixin ScrollPaginationMixin<T extends StatefulWidget> on State<T> {
  late final ScrollController _scrollController;

  ScrollController get scrollController => _scrollController;

  /// Override this to provide the pagination logic.
  void onPageFetched();

  /// Throttling logic can be added here if needed.
  void _onScroll() {
    if (_isNearBottom) {
      onPageFetched();
    }
  }

  bool get _isNearBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    // Pre-fetch at 80% to ensure seamless scrolling
    return currentScroll >= (maxScroll * 0.8);
  }

  void scrollToTop() {
    if (_scrollController.hasClients) {
      unawaited(
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
