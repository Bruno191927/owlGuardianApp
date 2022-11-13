import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hackathon_app/data/datasource/api/cloudinary_api.dart';
import 'package:hackathon_app/data/datasource/api/incident_api.dart';
import 'package:hackathon_app/data/models/incident_model.dart';
import 'package:hackathon_app/data/models/photo_model.dart';
import 'package:hackathon_app/data/repositori_impl/incident_repository_impl.dart';
import 'package:hackathon_app/domain/repositories/incident_repository.dart';
import 'package:hackathon_app/presentation/logic/provider/image_provider.dart';
import 'package:hackathon_app/presentation/logic/provider/incident_provider.dart';
class IncidenceController {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  BuildContext? context;
  IncidenceController({this.context});
  final IncidentRepository _repository = IncidentRepositoryImpl(IncidentApi());


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


  void sumbit(ImageDataProvider provider,IncidentProvider incidentProvider) async{
    //
    final myPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    PhotoModel? modelPhoto;

    if(provider.imgInfo != null){
      final bytes = await File(provider.imgInfo!.path).readAsBytes();
      final isImageUpload = await PhotoAPI.instance.uploadPhoto(bytes, provider.imgInfo!.path, context!);
      modelPhoto = isImageUpload;
    }


    final newIncident = IncidentModel(
      id: "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      lat: myPosition.longitude,
      timeOfIncident:incidentProvider.currentDate.toUtc().toString().substring(0,11)+incidentProvider.currentTime.hour.toString()+":"+incidentProvider.currentTime.minute.toString(),
      image: (modelPhoto != null)?modelPhoto:null,
      description: descriptionController.text,
      category: incidentProvider.categoryValue,
      long: myPosition.longitude,
      title: titleController.text,
      user: null
    );

    final data = await _repository.createIncident(model: newIncident);

    if(data){
      Navigator.pop(context!);
    }
  }
}
