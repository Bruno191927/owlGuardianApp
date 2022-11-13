import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/core/colors/app_colors.dart';

class CustomDateTimeButton extends StatefulWidget {
  final double margin;
  final TextEditingController? controller;
  final String? initialValue;
  final String text;
  final VoidCallback? onTap;
  const CustomDateTimeButton(
      {Key? key,
      this.margin = 15.0,
      this.controller,
      this.initialValue,
      this.text = "",
      this.onTap})
      : super(key: key);

  @override
  State<CustomDateTimeButton> createState() => _CustomDateTimeButtonState();
}

class _CustomDateTimeButtonState extends State<CustomDateTimeButton> {
  DateTime _datetime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: widget.margin),
        child: TextFormField(
          controller: widget.controller,
          initialValue: widget.initialValue,
          decoration: InputDecoration(
            labelText: widget.text,
            labelStyle: TextStyle(color: AppColors.grey),
            prefixIcon: Icon(Icons.date_range_outlined, color: AppColors.grey),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red),
                borderRadius: BorderRadius.circular(16.0)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.orange),
                borderRadius: BorderRadius.circular(16.0)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.orange),
                borderRadius: BorderRadius.circular(16.0)),
          ),
          keyboardType: TextInputType.none,
          style: TextStyle(color: AppColors.black),
          onTap: widget.onTap,
        ));
  }

  Future pickDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) return;
    // TimeOfDay? time = await pickTime();
    // if (time == null) return;
    // return DateTime(date.year, date.month, date.day, time.hour, time.minute);
    return DateTime(date.year, date.month, date.day);
    // setState(() => _datetime = dateTime);
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: _datetime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));

  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: _datetime.hour, minute: _datetime.minute));
}
