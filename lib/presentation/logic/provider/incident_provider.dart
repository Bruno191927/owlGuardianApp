import 'package:flutter/material.dart';

class IncidentProvider with ChangeNotifier{
   late DateTime _currentDate;
  late TimeOfDay _currentTime;
  late String _categoryValue;

  DateTime get currentDate => _currentDate;
  TimeOfDay get currentTime => _currentTime;
  String get categoryValue => _categoryValue;

  void changeCurrentDate(DateTime val){
    _currentDate = val;
    notifyListeners();
  }

  void changeCurrentTime(TimeOfDay val){
    _currentTime = val;
    notifyListeners();
  }

  void changeCategoryValue(String val){
    _categoryValue = val;
    notifyListeners();
  }
}