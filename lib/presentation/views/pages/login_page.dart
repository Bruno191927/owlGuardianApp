import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/core/colors/app_colors.dart';
import 'package:hackathon_app/presentation/core/shared_widgets/custom_elevatedbutton_widget.dart';
import 'package:hackathon_app/presentation/core/shared_widgets/custom_textfieldform_widget.dart';
import 'package:hackathon_app/presentation/views/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  static const routeName = "login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Container(
          padding: const EdgeInsets.all(10.0),
          constraints: const BoxConstraints.expand(),
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(children: [
                const SizedBox(height: 40.0),
                // Logo de la App
                ColoredBox(
                    color: AppColors.text.cyan.withOpacity(0.3),
                    child: const SizedBox(width: 250.0, height: 200.0)),
                const SizedBox(height: 40.0),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('INGRESAR',
                      style: TextStyle(
                          color: AppColors.text.rawText, fontSize: 30.0)),
                  const SizedBox(height: 8.0),
                  Text('Por favor, complete los siguientes campos:',
                      style: TextStyle(color: AppColors.text.fieldForm))
                ]),
                const SizedBox(height: 40.0),
                const CustomTextFieldForm(
                    text: 'Correo eletrónico',
                    icon: Icons.email_outlined,
                    inputType: TextInputType.emailAddress),
                const SizedBox(height: 20.0),
                const CustomTextFieldForm(
                    text: 'Contraseña',
                    icon: Icons.password_outlined,
                    inputType: TextInputType.visiblePassword,
                    obscureText: true),
                const SizedBox(height: 40.0),
                const CustomElevatedButton(text: 'Iniciar sesión'),
                TextButton(
                    onPressed: () {},
                    child: Text('¿Olvidaste la contraseña?',
                        style: TextStyle(color: AppColors.text.cyan))),
                const SizedBox(height: 20.0),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('¿Aún no tienes una cuenta?',
                      style: TextStyle(color: AppColors.text.fieldForm)),
                  TextButton(
                      onPressed: () {Navigator.pushNamed(context, RegisterPage.routeName);},
                      child: Text('Registrarse',
                          style: TextStyle(color: AppColors.text.cyan)))
                ])
              ]))),
      backgroundColor: AppColors.scaffold.background);
}
