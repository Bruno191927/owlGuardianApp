import 'package:flutter/cupertino.dart';
import 'package:hackathon_app/data/datasource/api/auth_api.dart';
import 'package:hackathon_app/data/repositori_impl/auth_repository_impl.dart';
import 'package:hackathon_app/domain/repositories/auth_respository.dart';
import 'package:hackathon_app/presentation/views/pages/register/register_page.dart';
import 'package:hackathon_app/presentation/views/pages/splash/splash_page.dart';

class LoginController {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  BuildContext? context;
  final AuthRepository _repository = AuthRepositoryImpl(AuthApi());
  LoginController({this.context});

  void init({required BuildContext context}) {
    this.context = context;
  }

  void submit() async {
    final _isValid = formKey.currentState?.validate() ?? false;
    if(_isValid){
      final loginOk = await  _repository.login(email: emailController.text, password: passwordController.text);
      if(loginOk){
        Navigator.pushNamed(context!, SplashPage.routeName);
      }
    }
  }

  void register() {
    Navigator.pushNamed(context!, RegisterPage.routeName);
  }
}
