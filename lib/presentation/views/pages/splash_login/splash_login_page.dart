import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_app/data/datasource/local/auth.dart';
import 'package:hackathon_app/presentation/core/colors/app_colors.dart';
import 'package:hackathon_app/presentation/views/pages/home/home_page.dart';
import 'package:hackathon_app/presentation/views/pages/login/login_page.dart';
import 'package:hackathon_app/presentation/views/pages/splash/splash_page.dart';
class SplashLoginPage extends StatefulWidget {
  const SplashLoginPage({ Key? key }) : super(key: key);

  @override
  State<SplashLoginPage> createState() => _SplashLoginPageState();
}

class _SplashLoginPageState extends State<SplashLoginPage> with AfterLayoutMixin{

  @override
  void afterFirstLayout(BuildContext context) {
    _check();
  }

  _check() async {
    final String? token = await Auth.instance.accessToken;
    if(token != null){
      Navigator.pushReplacementNamed(context, SplashPage.routeName);
    }
    else{
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.cyan),
      ),
      ),
    );
  }
}