import 'dart:async';

import 'package:flutter/foundation.dart';

class Debounce {
  Debounce({
    this.milliseconds = 500,
  });

  final int milliseconds;
  Timer? _timer;

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
