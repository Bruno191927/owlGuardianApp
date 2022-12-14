import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/core/colors/app_colors.dart';
import 'package:hackathon_app/presentation/core/shared_widgets/custom_elevatedbutton_widget.dart';
import 'package:hackathon_app/presentation/core/shared_widgets/custom_textfieldform_widget.dart';
import 'package:hackathon_app/presentation/views/pages/login/login_page.dart';
import 'package:hackathon_app/presentation/views/pages/register/register_controller.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = "register";
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController _registerController = RegisterController();

  @override
  void initState() {
    super.initState();
    _registerController.init(context: context);
  }

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
                    style: TextStyle(color: AppColors.white, fontSize: 30.0)),
                const SizedBox(height: 8.0),
                Text('Por favor, complete el siguiente formulario:',
                    style: TextStyle(color: AppColors.white70)),
                const SizedBox(height: 40.0),
                Form(
                    key: _registerController.formKey,
                    child: Wrap(runSpacing: 20.0, children: [
                      CustomTextFieldForm(
                          text: 'Nombres',
                          icon: Icons.person_outline,
                          inputType: TextInputType.name,
                          controller: _registerController.firstNameCtrontoller,
                      ),
                      CustomTextFieldForm(
                          text: 'Apellidos',
                          icon: Icons.person_outline,
                          inputType: TextInputType.name,
                          controller: _registerController.lastNameController,
                      ),
                      CustomTextFieldForm(
                          text: 'Documento de Identidad',
                          icon: Icons.person_outline,
                          inputType: TextInputType.name,
                          controller: _registerController.documentNumberController,
                      ),
                      CustomTextFieldForm(
                          text: 'N??mero de celular',
                          icon: Icons.phone_android_outlined,
                          inputType: TextInputType.phone,
                          controller: _registerController.cellPhoneController,
                      ),
                      CustomTextFieldForm(
                          text: 'Correo electr??nico',
                          icon: Icons.email_outlined,
                          inputType: TextInputType.emailAddress,
                          controller: _registerController.emailController,
                      ),
                      CustomTextFieldForm(
                          controller: _registerController.passwordController1,
                          text: 'Contrase??a',
                          icon: Icons.password_outlined,
                          inputType: TextInputType.visiblePassword,
                          obscureText: true
                      ),
                      CustomTextFieldForm(
                          controller: _registerController.passwordController2,
                          text: 'Confirmar contrase??a',
                          icon: Icons.password_outlined,
                          inputType: TextInputType.visiblePassword,
                          obscureText: true,
                          targetController: _registerController.passwordController1
                      ),
                    ]),
                    autovalidateMode: AutovalidateMode.onUserInteraction),
                const SizedBox(height: 40.0),
                CustomElevatedButton(
                  text: 'Registrarse',
                  onPressed: () {
                    _registerController.submit(context);
                  },
                ),
                const SizedBox(height: 40.0),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('??Ya tienes una cuenta?',
                      style: TextStyle(color: AppColors.white70)),
                  TextButton(
                      onPressed: () => Navigator.of(context).push(
                          (MaterialPageRoute(
                              builder: (context) => const LoginPage()))),
                      child: Text('Ingresa aqu??',
                          style: TextStyle(color: AppColors.cyan)))
                ])
              ]))),
      backgroundColor: AppColors.greyBackground);
}
