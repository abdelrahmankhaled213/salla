import 'dart:async';

import 'package:flutter/material.dart';

class DeBouncer {

  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

   DeBouncer({required this.milliseconds});

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    _timer?.cancel();
  }
}