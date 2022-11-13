import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/core/colors/app_colors.dart';

class CustomDropDownButton extends StatelessWidget {
  final double margin;
  final List<String> items;
  final String text;
  const CustomDropDownButton({
    Key? key,
    this.margin = 15.0,
    required this.items,
    this.text = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: margin),
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField(
            items: items.map(buildMenuItem).toList(),
            onChanged: (value) {},
            decoration: InputDecoration(
                labelText: text,
                labelStyle: TextStyle(color: AppColors.grey),
                prefixIcon: Icon(Icons.ac_unit, color: AppColors.grey),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red),
                    borderRadius: BorderRadius.circular(16.0)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.orange),
                    borderRadius: BorderRadius.circular(16.0))),
            isExpanded: true,
          ),
        ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));
}
