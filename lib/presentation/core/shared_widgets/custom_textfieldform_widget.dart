import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/core/colors/app_colors.dart';

class CustomTextFieldForm extends StatefulWidget {
  final double margin;
  final String text;
  final IconData icon;
  final TextInputType inputType;
  final bool obscureText;
  const CustomTextFieldForm(
      {Key? key,
      this.margin = 15.0,
      this.text = '',
      this.icon = Icons.crop_square,
      this.inputType = TextInputType.text,
      this.obscureText = false})
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
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.text.cyan),
                borderRadius: BorderRadius.circular(16.0)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.transparent))),
        keyboardType: widget.inputType,
        style: TextStyle(color: AppColors.text.rawText),
        obscureText: widget.obscureText ? _isPressed : false,
        validator: (value) => _errorSelection(widget.inputType.index, value!),
      ));
}

_errorSelection(int inpuIndex, String text) {
  if (inpuIndex == 0) return _errorFullName(text);
  // if (inpuIndex == 2) return _errorNumber(text);
}

String? _errorFullName(String text) {
  if (text.isEmpty) {
    return 'Ingrese un nombre';
  }
  if (text.length > 27) {
    return 'El nombre no puede exceder los 27 caracteres';
  }
  return null;
}
