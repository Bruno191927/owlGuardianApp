import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/views/pages/home/home_page.dart';
import 'package:hackathon_app/presentation/views/pages/login/login_page.dart';
import 'package:hackathon_app/presentation/views/pages/register/register_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  LoginPage.routeName: (_) => const LoginPage(),
  RegisterPage.routeName: (_) => const RegisterPage(),
  HomePage.routeName: (_) => const HomePage(),
};
