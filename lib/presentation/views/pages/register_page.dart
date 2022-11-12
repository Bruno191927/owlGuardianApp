import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/core/colors/app_colors.dart';
import 'package:hackathon_app/presentation/core/shared_widgets/custom_elevatedbutton_widget.dart';
import 'package:hackathon_app/presentation/core/shared_widgets/custom_textfieldform_widget.dart';
import 'package:hackathon_app/presentation/views/pages/login_page.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = "register";
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          leading: const BackButton(),
          elevation: 0,
          backgroundColor: AppColors.transparent),
      body: Container(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(children: [
                Text('CREAR CUENTA',
                    style: TextStyle(
                        color: AppColors.text.rawText, fontSize: 30.0)),
                const SizedBox(height: 8.0),
                Text('Por favor, complete el siguiente formulario:',
                    style: TextStyle(color: AppColors.text.fieldForm)),
                const SizedBox(height: 40.0),
                const CustomTextFieldForm(
                    text: 'Nombre completo',
                    icon: Icons.person_outline,
                    inputType: TextInputType.name),
                const SizedBox(height: 20.0),
                const CustomTextFieldForm(
                    text: 'Número de celular',
                    icon: Icons.phone_android_outlined,
                    inputType: TextInputType.phone),
                const SizedBox(height: 20.0),
                const CustomTextFieldForm(
                    text: 'Correo electrónico',
                    icon: Icons.email_outlined,
                    inputType: TextInputType.emailAddress),
                const SizedBox(height: 20.0),
                const CustomTextFieldForm(
                    text: 'Contraseña',
                    icon: Icons.password_outlined,
                    inputType: TextInputType.visiblePassword,
                    obscureText: true),
                const SizedBox(height: 20.0),
                const CustomTextFieldForm(
                    text: 'Confirmar contraseña',
                    icon: Icons.password_outlined,
                    inputType: TextInputType.visiblePassword,
                    obscureText: true),
                const SizedBox(height: 40.0),
                const CustomElevatedButton(text: 'Registrarse'),
                const SizedBox(height: 40.0),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('¿Ya tienes una cuenta?',
                      style: TextStyle(color: AppColors.text.fieldForm)),
                  TextButton(
                      onPressed: () => Navigator.of(context).push(
                          (MaterialPageRoute(
                              builder: (context) => const LoginPage()))),
                      child: Text('Ingresa aquí',
                          style: TextStyle(color: AppColors.text.cyan)))
                ]),
              ]))),
      backgroundColor: AppColors.scaffold.background);
}
