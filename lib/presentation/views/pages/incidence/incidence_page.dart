import 'package:flutter/cupertino.dart';
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
  late DateTime _datetime;
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
    _datetime = DateTime.now();
  }

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
                CustomDropDownButton(
                  items: _categoryItems,
                  text: "Catorgías",
                ),
                const SizedBox(height: 20.0),
                /*CustomDateTimeButton(
                    initialValue:
                        "${_datetime.year}-${_datetime.month}-${_datetime.day}",
                    text: "Fecha",
                    onTap: () async {
                      final _curreDateTime = await _incidenceController
                          .pickDate(context, _datetime);
                      setState(() => _datetime = _curreDateTime!);
                    }),*/
                CupertinoButton(child: Text('GG'), onPressed: () async{
                  final time = await showDatePicker(
                    context: context, 
                    initialDate: DateTime.now(), 
                    firstDate: DateTime(2010, 1, 1), 
                    lastDate: DateTime(2030, 1, 1),
                    
                  );

                  print(time);
                }),
                const SizedBox(height: 20.0),
                CustomTextFieldForm(
                  text: "Fecha",
                  icon: Icons.date_range_outlined,
                  inputType: TextInputType.datetime,
                  textColor: AppColors.black,
                  textFormColor: AppColors.black,
                  borderColor: AppColors.orange,
                ),
                const SizedBox(height: 20.0),
                CustomElevatedButton(
                  text: "Agregar",
                  onPressed: () {},
                  buttonColor: AppColors.orange,
                  textColor: AppColors.white,
                ),
              ],
            ),
          )),
    );
  }
}
