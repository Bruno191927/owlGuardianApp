import 'package:flutter/cupertino.dart';
import 'package:hackathon_app/data/datasource/api/auth_api.dart';
import 'package:hackathon_app/data/repositori_impl/auth_repository_impl.dart';
import 'package:hackathon_app/domain/repositories/auth_respository.dart';
import 'package:hackathon_app/presentation/views/pages/splash/splash_page.dart';

class RegisterController {
  BuildContext? context;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController passwordController1 = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();
  final TextEditingController firstNameCtrontoller = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController cellPhoneController = TextEditingController();
  final TextEditingController documentNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final AuthRepository _repository = AuthRepositoryImpl(AuthApi());

  RegisterController({this.context});

  void init({required BuildContext context}) {
    this.context = context;
  }

  void submit(BuildContext context) async{
    final _isValid = formKey.currentState?.validate() ?? false;
    final _sameText = passwordController1.text == passwordController2.text;
    if (_isValid && _sameText) {
      final loginOk = await _repository.singin(
        email: emailController.text.trim(), 
        password: passwordController1.text, 
        firstName: firstNameCtrontoller.text, 
        lastName: lastNameController.text, 
        cellPhone: cellPhoneController.text, 
        documentNumber: documentNumberController.text
      );
      if(loginOk){
        Navigator.pushReplacementNamed(context, SplashPage.routeName);
      }
    }
  }
}
