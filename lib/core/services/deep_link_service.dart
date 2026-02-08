import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/widgets.dart';

import '../router/app_router.dart';
import '../utils/auth_logger.dart';

/// Service to handle deep linking.
///
/// REFACTOR: Now stateless. It simply listens to incoming links and forwards them
/// to the router. The Router is responsible for deciding whether to redirect
/// to login (and keeping the 'redirect_to' query param) or to the target.
class DeepLinkService with WidgetsBindingObserver {
  DeepLinkService(); // No dependencies needed

  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _linkSubscription;

  /// Initialize the DeepLinkService
  Future<void> init() async {
    WidgetsBinding.instance.addObserver(this);

    // 1. Handle Cold Start
    await _handleColdStart();

    // 2. Listen to incoming links (Background & Foreground)
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (uri) => _handleLink(uri),
      onError: (err) {
        AuthLogger.error('Deep link error: $err');
      },
    );
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _linkSubscription?.cancel();
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
        // GoRouter usually handles cold start automatically if configured with platform channels,
        // but explicit handling ensures we catch it.
        // We defer to _handleLink which will use GoRouter to navigate.
        _handleLink(uri);
      }
    } catch (e) {
      AuthLogger.error('Failed to get initial deep link', e);
    }
  }

  /// Handles incoming links (Foreground / Background)
  void _handleLink(Uri uri) {
    AuthLogger.info('Incoming deep link: $uri');

    // Simple forward to Router. Router will handle Auth protection logic.
    try {
      final currentUri =
          AppRouter.router.routerDelegate.currentConfiguration.uri;

      // Avoid self-navigation/loops if we are already there
      // (Ignoring query params might be risky if query params changed, so we compare full string)
      if (currentUri.toString() != uri.toString()) {
        AppRouter.router.go(uri.toString());
      } else {
        AuthLogger.debug('Ignoring duplicate deep link navigation: $uri');
      }
    } catch (e) {
      AuthLogger.error('Failed to navigate to deep link', e);
    }
  }
}
