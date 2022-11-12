import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/core/colors/app_colors.dart';
import 'package:hackathon_app/presentation/core/utils/my_validators.dart';

class CustomTextFieldForm extends StatefulWidget {
  final double margin;
  final String text;
  final IconData icon;
  final TextInputType inputType;
  final bool obscureText;
  final TextEditingController? controller;
  final TextEditingController? targetController;
  final Color textColor;
  final Color textFormColor;
  final Color borderColor;
  final VoidCallback? onTap;
  final String? initialValue;
  const CustomTextFieldForm({
    Key? key,
    this.margin = 15.0,
    this.text = "",
    this.icon = Icons.crop_square,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.controller,
    this.targetController,
    this.textColor = Colors.white,
    this.textFormColor = Colors.white70,
    this.borderColor = Colors.cyanAccent,
    this.onTap,
    this.initialValue,
  }) : super(key: key);

  @override
  State<CustomTextFieldForm> createState() => _CustomTextFieldFormState();
}

class _CustomTextFieldFormState extends State<CustomTextFieldForm> {
  DateTime _datetime = DateTime.now();
  bool _isPressed = true;

  @override
  Widget build(BuildContext context) => Container(
      margin: EdgeInsets.symmetric(horizontal: widget.margin),
      child: TextFormField(
        controller: widget.controller,
        initialValue: widget.inputType.index == 4
            ? "${_datetime.year}-${_datetime.month}-${_datetime.day} ${_datetime.hour}:${_datetime.minute}"
            : widget.initialValue,
        decoration: InputDecoration(
            labelText: widget.text,
            labelStyle: TextStyle(color: widget.textFormColor),
            prefixIcon: Icon(widget.icon, color: widget.textFormColor),
            suffixIcon: widget.obscureText
                ? IconButton(
                    onPressed: () => setState(() => _isPressed = !_isPressed),
                    icon: _isPressed
                        ? Icon(
                            Icons.visibility_off_outlined,
                            color: widget.textFormColor,
                          )
                        : Icon(Icons.visibility_outlined,
                            color: widget.textFormColor))
                : null,
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red),
                borderRadius: BorderRadius.circular(16.0)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: widget.borderColor),
                borderRadius: BorderRadius.circular(16.0)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red),
                borderRadius: BorderRadius.circular(16.0)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.transparent))),
        keyboardType:
            widget.inputType.index == 4 ? TextInputType.none : widget.inputType,
        style: TextStyle(color: widget.textColor),
        obscureText: widget.obscureText ? _isPressed : false,
        onTap: () async =>
            widget.inputType.index == 4 ? await pickDateTime() : widget.onTap,
        validator: (value) => _errorSelection(widget.inputType.index, value!),
      ));

  String? _errorSelection(int input, String text) {
    if (input == 3) return MyValidators.validatePhoneNumber(text);
    if (input == 5) return MyValidators.validateEmail(text);
    if (input == 7) {
      return MyValidators.validatePassword(
          text, widget.targetController ?? widget.controller!);
    }
    if (input == 8) return MyValidators.validateFullName(text);
  }

  Future pickDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) return;
    TimeOfDay? time = await pickTime();
    if (time == null) return;
    final dateTime =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);
    setState(() => _datetime = dateTime);
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
