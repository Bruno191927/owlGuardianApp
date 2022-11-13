import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/core/colors/app_colors.dart';
import 'package:hackathon_app/presentation/core/shared_widgets/custom_dropdownbutton_widget.dart';
import 'package:hackathon_app/presentation/core/shared_widgets/custom_elevatedbutton_widget.dart';
import 'package:hackathon_app/presentation/core/shared_widgets/custom_textfieldform_widget.dart';

class IncidencePage extends StatefulWidget {
  static const routeName = "incidence";
  const IncidencePage({Key? key}) : super(key: key);

  @override
  State<IncidencePage> createState() => _IncidencePageState();
}

class _IncidencePageState extends State<IncidencePage> {
  final _categoryItems = [
    'Muy ligera',
    'Ligera',
    'Regular',
    'Activa',
    'Muy Activa'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(color: AppColors.black),
          elevation: 0,
          backgroundColor: AppColors.transparent),
      body: Container(
          padding: const EdgeInsets.all(10.0),
          constraints: const BoxConstraints.expand(),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const Text(
                  "NUEVA INCIDENCIA",
                  style: TextStyle(fontSize: 30.0),
                ),
                const SizedBox(height: 30.0),
                CustomTextFieldForm(
                  text: "Título",
                  icon: Icons.title_outlined,
                  textColor: AppColors.black,
                  textFormColor: AppColors.grey,
                  borderColor: AppColors.orange,
                ),
                const SizedBox(height: 20.0),
                CustomTextFieldForm(
                  text: "Descripción",
                  icon: Icons.description,
                  textColor: AppColors.black,
                  textFormColor: AppColors.grey,
                  borderColor: AppColors.orange,
                ),
                const SizedBox(height: 20.0),
                CustomDropDownButton(items: _categoryItems),
                const SizedBox(height: 20.0),
                CustomElevatedButton(
                  text: "Agregar",
                  onPressed: () {},
                  buttonColor: AppColors.orange,
                  textColor: AppColors.white,
                )
              ],
            ),
          )),
    );
  }
}
