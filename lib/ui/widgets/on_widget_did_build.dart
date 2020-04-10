import 'package:flutter/material.dart';
///
/// we use this class as mixin on widget for accessing after method build callback
///
class OnWidgetBuildMixin {
  void onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}