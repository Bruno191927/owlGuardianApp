import 'package:flutter/material.dart';

class ProfileController {
  BuildContext? context;
  ProfileController({this.context});

  void init({required BuildContext context}) {
    this.context = context;
  }
}
