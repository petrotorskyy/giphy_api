import 'dart:async';

import 'package:flutter/material.dart';

class DelayedAction {
  factory DelayedAction() => _instance;

  DelayedAction._();
  static final DelayedAction _instance = DelayedAction._();
  static Timer? _timer;
  static void run(
    VoidCallback action, {
    //request is sent in N milliseconds (for example 300)
    Duration delay = const Duration(milliseconds: 300),
  }) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }
}
