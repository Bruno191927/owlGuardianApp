import 'package:flutter/cupertino.dart';
import 'package:hackathon_app/presentation/core/globals/global_resources.dart';

class RegisterController {
  BuildContext? context;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController passwordController1 = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();
  RegisterController({this.context});

  void init({required BuildContext context}) {
    this.context = context;
  }

  void submit() {
    final _isValid = _formKey.currentState!.validate();
    // final _sameText = passwordController1.text == passwordController2.text;
    if (_isValid) {
      print("El formulario es valido");
    } else {
      print("Formualrio inválido");
    }
  }
}
