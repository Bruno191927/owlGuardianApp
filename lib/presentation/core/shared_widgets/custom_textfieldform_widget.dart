import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/core/colors/app_colors.dart';

class CustomTextFieldForm extends StatefulWidget {
  final double margin;
  final String text;
  final IconData icon;
  final TextInputType inputType;
  final bool obscureText;
  final VoidCallback? onTap;
  const CustomTextFieldForm({
    Key? key,
    this.margin = 15.0,
    this.text = '',
    this.icon = Icons.crop_square,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.onTap,
  }) : super(key: key);

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
        onTap: widget.onTap,
      ));
}
