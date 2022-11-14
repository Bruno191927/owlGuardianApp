import 'package:flutter/material.dart';
import 'package:hackathon_app/data/models/incident_model.dart';

class IncidentProvider with ChangeNotifier{
   late DateTime _currentDate;
  late TimeOfDay _currentTime;
  late String _categoryValue;

  late IncidentModel _selectIncident;

  DateTime get currentDate => _currentDate;
  TimeOfDay get currentTime => _currentTime;
  String get categoryValue => _categoryValue;

  IncidentModel get selectIncident => _selectIncident;

  void changeCurrentDate(DateTime val){
    _currentDate = val;
    notifyListeners();
  }

  void changeCurrentTime(TimeOfDay val){
    _currentTime = val;
    notifyListeners();
  }

  void changeIncident(IncidentModel model){
    _selectIncident = model;
    notifyListeners();
  }

  void changeCategoryValue(String val){
    _categoryValue = val;
    notifyListeners();
  }
}