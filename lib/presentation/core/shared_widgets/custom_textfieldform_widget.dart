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
  const CustomTextFieldForm(
      {Key? key,
      this.margin = 15.0,
      this.text = "",
      this.icon = Icons.crop_square,
      this.inputType = TextInputType.text,
      this.obscureText = false,
      this.controller,
      this.targetController})
      : super(key: key);

  @override
  State<CustomTextFieldForm> createState() => _CustomTextFieldFormState();
}

class _CustomTextFieldFormState extends State<CustomTextFieldForm> {
  bool _isPressed = true;

  @override
  Widget build(BuildContext context) => Container(
      margin: EdgeInsets.symmetric(horizontal: widget.margin),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
            labelText: widget.text,
            labelStyle: TextStyle(color: AppColors.text.fieldForm),
            prefixIcon: Icon(widget.icon, color: AppColors.text.fieldForm),
            suffixIcon: widget.obscureText
                ? IconButton(
                    onPressed: () => setState(() => _isPressed = !_isPressed),
                    icon: _isPressed
                        ? Icon(
                            Icons.visibility_off_outlined,
                            color: AppColors.text.fieldForm,
                          )
                        : Icon(Icons.visibility_outlined,
                            color: AppColors.text.fieldForm))
                : null,
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red),
                borderRadius: BorderRadius.circular(16.0)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.text.cyan),
                borderRadius: BorderRadius.circular(16.0)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red),
                borderRadius: BorderRadius.circular(16.0)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.transparent))),
        keyboardType: widget.inputType,
        style: TextStyle(color: AppColors.text.rawText),
        obscureText: widget.obscureText ? _isPressed : false,
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
}
