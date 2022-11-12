import 'package:flutter/material.dart';

class AppColors {
  static _Scaffold scaffold = _Scaffold();
  static _Text text = _Text();
  static Color red = Colors.red;
  static Color transparent = Colors.transparent;
  static Color orange = Colors.orange;
}

class _Scaffold {
  Color background = Colors.grey.shade900;
}

class _Text {
  Color rawText = Colors.white;
  Color black = Colors.black;
  Color cyan = Colors.cyanAccent;
  Color fieldForm = Colors.white70;
}
