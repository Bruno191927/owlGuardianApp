import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/views/pages/home/home_page.dart';
import 'package:hackathon_app/presentation/views/pages/login/login_page.dart';
import 'package:hackathon_app/presentation/views/pages/register/register_page.dart';
import 'package:hackathon_app/presentation/views/pages/request_permision/request_permission_page.dart';
import 'package:hackathon_app/presentation/views/pages/splash/splash_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  LoginPage.routeName: (_) => const LoginPage(),
  RegisterPage.routeName: (_) => const RegisterPage(),
  HomePage.routeName: (_) => const HomePage(),
  RequestPermissionPage.routeName: (_) => const RequestPermissionPage(),
  SplashPage.routeName: (_) => const SplashPage()
};
