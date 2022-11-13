import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/core/colors/app_colors.dart';
import 'package:hackathon_app/presentation/core/shared_widgets/custom_datetimebutton_widget.dart';
import 'package:hackathon_app/presentation/core/shared_widgets/custom_dropdownbutton_widget.dart';
import 'package:hackathon_app/presentation/core/shared_widgets/custom_elevatedbutton_widget.dart';
import 'package:hackathon_app/presentation/core/shared_widgets/custom_textfieldform_widget.dart';
import 'package:hackathon_app/presentation/views/pages/incidence/incidence_controller.dart';

class IncidencePage extends StatefulWidget {
  static const routeName = "incidence";
  const IncidencePage({Key? key}) : super(key: key);

  @override
  State<IncidencePage> createState() => _IncidencePageState();
}

class _IncidencePageState extends State<IncidencePage> {
  final IncidenceController _incidenceController = IncidenceController();
  File? _imageUrl;
  late DateTime _currentDate;
  late TimeOfDay _currentTime;
  final _categoryItems = [
    'Denuncia pública',
    'Disturbios',
    'Homicidios',
    'Obras inconclusas'
  ];

  @override
  void initState() {
    super.initState();
    _incidenceController.init(context: context);
    _currentDate = DateTime.now();
    _currentTime = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
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
                  const Text("NUEVA INCIDENCIA",
                      style: TextStyle(fontSize: 30.0)),
                  const SizedBox(height: 40.0),
                  CustomTextFieldForm(
                    text: "Título",
                    icon: Icons.title_outlined,
                    textColor: AppColors.black,
                    textFormColor: AppColors.grey,
                    borderColor: AppColors.orange,
                    enabledBorderColor: AppColors.orange,
                  ),
                  const SizedBox(height: 20.0),
                  CustomTextFieldForm(
                    text: "Descripción",
                    icon: Icons.description,
                    textColor: AppColors.black,
                    textFormColor: AppColors.grey,
                    borderColor: AppColors.orange,
                    enabledBorderColor: AppColors.orange,
                  ),
                  const SizedBox(height: 20.0),
                  CustomDropDownButton(
                      items: _categoryItems, text: "Catorgías"),
                  const SizedBox(height: 20.0),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: CustomDateTimeButton(
                                    icon: Icons.date_range_outlined,
                                    text:
                                        "${_currentDate.year}/${_currentDate.month}/${_currentDate.day}",
                                    onTap: () async {
                                      final _newDate =
                                          await _incidenceController.pickDate(
                                              context, _currentDate);
                                      setState(() => _currentDate = _newDate);
                                    })),
                            const SizedBox(width: 40.0),
                            Expanded(
                                child: CustomDateTimeButton(
                                    icon: Icons.access_time_outlined,
                                    text: _currentTime.format(context),
                                    onTap: () async {
                                      final _newTime =
                                          await _incidenceController.pickTime(
                                              context, _currentTime);
                                      setState(() => _currentTime = _newTime);
                                    }))
                          ])),
                  const SizedBox(height: 20.0),
                  Ink.image(
                      image: _imageUrl != null
                          ? FileImage(_imageUrl!) as ImageProvider
                          : const AssetImage('assets/no_image.png'),
                      fit: BoxFit.cover,
                      width: 250.0,
                      height: 150.0,
                      child: InkWell(
                          onTap: () async {
                            final File? _newImageUrl =
                                await _incidenceController.pickImge() ??
                                    _imageUrl;
                            setState(() => _imageUrl = _newImageUrl);
                          },
                          splashColor: AppColors.orange.withOpacity(0.3))),
                  const SizedBox(height: 40.0),
                  CustomElevatedButton(
                    text: "Agregar",
                    onPressed: () {},
                    buttonColor: AppColors.orange,
                    textColor: AppColors.white,
                  ),
                ],
              ),
            )),
      ),
      onWillPop: () async =>
          await _incidenceController.showWarning(context) ?? false,
    );
  }
}
