import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';

mixin ConnectivityMixin<T extends StatefulWidget> on State<T> {
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  /// Override this to handle connectivity changes.
  void onConnectivityChanged({required bool isConnected});

  Future<void> checkInitialConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final isConnected = !connectivityResult.contains(ConnectivityResult.none);
    if (mounted) {
      onConnectivityChanged(isConnected: isConnected);
    }
  }

  void startConnectivityListener() {
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((
      results,
    ) {
      final isConnected = !results.contains(ConnectivityResult.none);
      if (mounted) {
        onConnectivityChanged(isConnected: isConnected);
      }
    });
  }

  @override
  void dispose() {
    unawaited(_connectivitySubscription?.cancel());
    _connectivitySubscription = null;
    super.dispose();
  }
}
