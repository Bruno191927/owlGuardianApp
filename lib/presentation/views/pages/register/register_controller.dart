import 'package:flutter/cupertino.dart';

class RegisterController {
  BuildContext? context;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController passwordController1 = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();
  RegisterController({this.context});

  void init({required BuildContext context}) {
    this.context = context;
  }

  void submit() {
    final _isValid = formKey.currentState?.validate() ?? false;
    final _sameText = passwordController1.text == passwordController2.text;
    if (_isValid && _sameText) {
      print("Formulario válido");
    }
  }
}
