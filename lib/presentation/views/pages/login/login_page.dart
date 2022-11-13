import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hackathon_app/presentation/core/colors/app_colors.dart';
import 'package:hackathon_app/presentation/core/shared_widgets/custom_elevatedbutton_widget.dart';
import 'package:hackathon_app/presentation/core/shared_widgets/custom_textfieldform_widget.dart';
import 'package:hackathon_app/presentation/views/pages/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _loginController = LoginController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      _loginController.init(context: context);
    });
  }

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
                Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo.png')
                    )
                  ),
                ),
                const SizedBox(height: 40.0),
                Form(
                  key: _loginController.formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('OWL GUARDIAN',style: TextStyle(color: AppColors.cyan, fontSize: 30.0,fontWeight: FontWeight.bold)),
                        ],
                      ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Por favor, complete los siguientes campos:',style: TextStyle(color: AppColors.white70))
                      ],
                    ),
                    const SizedBox(height: 40.0),
                    CustomTextFieldForm(
                      text: 'Correo eletrónico',
                      icon: Icons.email_outlined,
                      inputType: TextInputType.emailAddress,
                      controller: _loginController.emailController,
                    ),
                    const SizedBox(height: 20.0),
                    CustomTextFieldForm(
                      text: 'Contraseña',
                      icon: Icons.password_outlined,
                      inputType: TextInputType.visiblePassword,
                      obscureText: true,
                      controller: _loginController.passwordController,
                    ),
                    const SizedBox(height: 40.0),
                    CustomElevatedButton(
                      text: 'Iniciar sesión',
                      onPressed: () => _loginController.submit(),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('¿Olvidaste la contraseña?',
                        style: TextStyle(color: AppColors.cyan)
                      )
                    ),
                    const SizedBox(height: 20.0),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text('¿Aún no tienes una cuenta?',
                          style: TextStyle(color: AppColors.white70)),
                      TextButton(
                          onPressed: () => _loginController.register(),
                          child: Text('Registrarse',
                              style: TextStyle(color: AppColors.cyan)))
                    ])
                  ]),
                ),
                
                
                
              ]))),
      backgroundColor: AppColors.greyBackground);
}
