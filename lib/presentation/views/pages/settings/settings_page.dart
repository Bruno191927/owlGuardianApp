import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/core/colors/app_colors.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = "";
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkModeToggle = false;
  final bool _breakfastToggle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: BackButton(color: AppColors.black),
            title: const Text(
              'Configuración',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: AppColors.transparent),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SwitchListTile(
                  value: _darkModeToggle,
                  onChanged: (value) {
                    setState(() => _darkModeToggle = value);
                  },
                  activeColor: AppColors.orange,
                  title: const Text('Modo oscuro',
                      style: TextStyle(fontSize: 20.0)),
                  subtitle: const Text(
                      'Habilitar el modo oscuro para la interfaz de la app',
                      style: TextStyle(fontSize: 14.0))),
            ],
          ),
        ));
  }
}
