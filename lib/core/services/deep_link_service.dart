import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/widgets.dart';
import 'package:propix8/core/router/app_router.dart';
import 'package:propix8/core/utils/auth_logger.dart';

/// Service to handle deep linking.
class DeepLinkService with WidgetsBindingObserver {
  DeepLinkService();

  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _linkSubscription;

  /// Initialize the DeepLinkService
  Future<void> init() async {
    WidgetsBinding.instance.addObserver(this);

    // 1. Handle Cold Start
    await _handleColdStart();

    // 2. Listen to incoming links (Background & Foreground)
    _linkSubscription = _appLinks.uriLinkStream.listen(
      _handleLink,
      onError: (Object err) {
        AuthLogger.error('Deep link error: $err');
      },
    );
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_linkSubscription?.cancel());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    AuthLogger.debug('App Lifecycle State changed to: $state');
  }

  /// Handles the initial link when the app starts (Cold Start)
  Future<void> _handleColdStart() async {
    try {
      final uri = await _appLinks.getInitialLink();
      if (uri != null) {
        AuthLogger.info('Cold start deep link found: $uri');
        _handleLink(uri);
      }
    } on Exception catch (e) {
      AuthLogger.error('Failed to get initial deep link', e);
    }
  }

  /// Handles incoming links (Foreground / Background)
  void _handleLink(Uri uri) {
    AuthLogger.info('Incoming deep link: $uri');
    try {
      final currentUri =
          AppRouter.router.routerDelegate.currentConfiguration.uri;

      if (currentUri.toString() != uri.toString()) {
        AppRouter.router.go(uri.toString());
      } else {
        AuthLogger.debug('Ignoring duplicate deep link navigation: $uri');
      }
    } on Exception catch (e) {
      AuthLogger.error('Failed to navigate to deep link', e);
    }
  }
}
