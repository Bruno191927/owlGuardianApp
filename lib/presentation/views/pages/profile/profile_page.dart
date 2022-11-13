import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/core/colors/app_colors.dart';
import 'package:hackathon_app/presentation/core/shared_widgets/custom_textfieldform_widget.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = "profile";
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: BackButton(color: AppColors.black),
            title: const Text(
              'Perfil de Usuario',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: AppColors.transparent),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(children: [
                Expanded(
                  child: Text("Nombre:",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: AppColors.orange,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold)),
                ),
                Expanded(
                    flex: 4,
                    child: CustomTextFieldForm(
                        icon: Icons.person_outline,
                        initialValue: "Nombres",
                        textColor: AppColors.black,
                        textFormColor: AppColors.grey,
                        borderColor: AppColors.orange,
                        readOnly: true))
              ]),
              const SizedBox(height: 20.0),
              Row(children: [
                Expanded(
                  child: Text("Apellidos:",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: AppColors.orange,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold)),
                ),
                Expanded(
                    flex: 4,
                    child: CustomTextFieldForm(
                        icon: Icons.person_outline,
                        initialValue: "Apellidos",
                        textColor: AppColors.black,
                        textFormColor: AppColors.grey,
                        borderColor: AppColors.orange,
                        readOnly: true))
              ]),
              const SizedBox(height: 20.0),
              Row(children: [
                Expanded(
                  child: Text("DNI:",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: AppColors.orange,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold)),
                ),
                Expanded(
                    flex: 4,
                    child: CustomTextFieldForm(
                        icon: Icons.person_outline,
                        initialValue: "DNI",
                        textColor: AppColors.black,
                        textFormColor: AppColors.grey,
                        borderColor: AppColors.orange,
                        readOnly: true))
              ]),
              const SizedBox(height: 20.0),
              Row(children: [
                Expanded(
                  child: Text("Celular:",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: AppColors.orange,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold)),
                ),
                Expanded(
                    flex: 4,
                    child: CustomTextFieldForm(
                        icon: Icons.phone_android_outlined,
                        initialValue: "Celular",
                        textColor: AppColors.black,
                        textFormColor: AppColors.grey,
                        borderColor: AppColors.orange,
                        readOnly: true))
              ]),
              const SizedBox(height: 20.0),
              Row(children: [
                Expanded(
                  child: Text("Email:",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: AppColors.orange,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold)),
                ),
                Expanded(
                    flex: 4,
                    child: CustomTextFieldForm(
                        icon: Icons.email_outlined,
                        initialValue: "Email",
                        textColor: AppColors.black,
                        textFormColor: AppColors.grey,
                        borderColor: AppColors.orange,
                        readOnly: true))
              ]),
            ],
          ),
        ));
  }
}
