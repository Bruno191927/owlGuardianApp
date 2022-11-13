import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/core/colors/app_colors.dart';

class CustomDropDownButton extends StatelessWidget {
  final double margin;
  final List<String> items;
  final String text;
  final Color textFormColor;
  final Color borderColor;
  const CustomDropDownButton({
    Key? key,
    this.margin = 2.0,
    required this.items,
    this.text = "",
    this.textFormColor = Colors.white70,
    this.borderColor = Colors.white70,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: margin),
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField(
            items: items.map(buildMenuItem).toList(),
            onChanged: (value) {},
            // decoration: InputDecoration(
            //     labelText: text,
            //     labelStyle: TextStyle(color: textFormColor),
            //     prefixIcon:
            //         Icon(Icons.keyboard_arrow_down, color: textFormColor),
            //     errorBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: AppColors.red),
            //         borderRadius: BorderRadius.circular(16.0)),
            //     focusedBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: borderColor),
            //         borderRadius: BorderRadius.circular(16.0)),
            //     focusedErrorBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: AppColors.red),
            //         borderRadius: BorderRadius.circular(16.0)),
            //     enabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: AppColors.transparent))),
            isExpanded: true,
          ),
        ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));
}
