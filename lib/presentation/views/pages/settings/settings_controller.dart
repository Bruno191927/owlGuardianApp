import 'package:flutter/material.dart';

class SettingsController {
  BuildContext? context;
  SettingsController({this.context});

  void init({required BuildContext context}) {
    this.context = context;
  }
}
