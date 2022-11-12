import 'package:flutter/cupertino.dart';
import 'package:hackathon_app/presentation/views/pages/register/register_page.dart';
import 'package:hackathon_app/presentation/views/pages/splash/splash_page.dart';

class LoginController {
  BuildContext? context;
  LoginController({this.context});

  void init({required BuildContext context}) {
    this.context = context;
  }

  void submit() {
    Navigator.pushNamed(context!, SplashPage.routeName);
  }

  void register() {
    Navigator.pushNamed(context!, RegisterPage.routeName);
  }
}
