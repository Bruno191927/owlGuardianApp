import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/core/colors/app_colors.dart';
import 'package:hackathon_app/presentation/core/shared_widgets/custom_elevatedbutton_widget.dart';
import 'package:hackathon_app/presentation/core/shared_widgets/custom_textfieldform_widget.dart';

class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet({Key? key}) : super(key: key);

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      constraints: const BoxConstraints.expand(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5.0),
            const Text(
              "ALERTAS",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            CustomTextFieldForm(
                text: "Título de incidencia",
                icon: Icons.title_outlined,
                inputType: TextInputType.text,
                textColor: AppColors.black,
                textFormColor: AppColors.black,
                borderColor: AppColors.orange),
            const SizedBox(height: 15.0),
            CustomTextFieldForm(
                text: "Descripción de incidencia",
                icon: Icons.description,
                inputType: TextInputType.text,
                textColor: AppColors.black,
                textFormColor: AppColors.black,
                borderColor: AppColors.orange),
            const SizedBox(height: 15.0),
            CustomTextFieldForm(
                text: "Fecha",
                icon: Icons.date_range_outlined,
                inputType: TextInputType.datetime,
                textColor: AppColors.black,
                textFormColor: AppColors.black,
                borderColor: AppColors.orange),
            const SizedBox(height: 30.0),
            CustomElevatedButton(
              text: "Agregar",
              width: 150,
              onPressed: () {},
              buttonColor: AppColors.orange,
              textColor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
