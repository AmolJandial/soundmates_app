import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorController extends AutoDisposeNotifier<(int statusCode, String message)> {
  @override
  (int, String) build() {
    ref.onDispose(() {
      log('Error controller disposed');
    });
    log('Error controller built');

    return (0, '');
  }

  void setError(int statusCode, String message) {
    state = (statusCode, message);
  }

  void clearError() {
    state = (0, '');
  }
}
