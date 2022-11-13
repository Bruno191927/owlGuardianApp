import 'package:flutter/material.dart';

class IncidenceController {
  BuildContext? context;
  final String initialValue = "";
  IncidenceController({this.context});

  void init({required BuildContext context}) {
    this.context = context;
  }

  Future<DateTime?> pickDate(context, DateTime dateTime) async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (date == null) return dateTime;
    return date;
  }

  // Future<TimeOfDay?> pickTime(context) => showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));
}
