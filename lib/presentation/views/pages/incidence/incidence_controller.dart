import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class IncidenceController {
  BuildContext? context;
  IncidenceController({this.context});

  void init({required BuildContext context}) {
    this.context = context;
  }

  Future<DateTime> pickDate(context, DateTime date) async {
    DateTime? _newDate = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2010, 1, 1),
        lastDate: DateTime(2030, 1, 1));
    return _newDate ?? date;
  }

  Future<TimeOfDay> pickTime(context, TimeOfDay time) async {
    TimeOfDay? _newTime =
        await showTimePicker(context: context, initialTime: time);
    return _newTime ?? time;
  }

  Future<File?> pickImge() async {
    try {
      final _currentImageSource =
          await ImagePicker().pickImage(source: ImageSource.camera);
      return File(_currentImageSource!.path);
    } on PlatformException catch (e) {
      throw 'Error al seleccionar la imagen: $e';
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final _directory = await getApplicationDocumentsDirectory();
    final _imageName = basename(imagePath);
    final _newImagePath = File('${_directory.path}/$_imageName');
    return File(imagePath).copy(_newImagePath.path);
  }

  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
              title: const Text('¿Desea descartar los cambios realizados?'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    autofocus: true,
                    child: const Text('No', style: TextStyle(fontSize: 18.0))),
                TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('Sí', style: TextStyle(fontSize: 18.0)))
              ]));
}
