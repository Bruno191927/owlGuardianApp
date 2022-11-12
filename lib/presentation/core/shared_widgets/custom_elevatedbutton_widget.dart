import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/core/colors/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final double width;
  final String text;
  final VoidCallback? onPressed;
  const CustomElevatedButton(
      {Key? key, this.width = 250.0, this.text = '', this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
      width: width,
      height: 50.0,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              primary: AppColors.text.cyan,
              shadowColor: AppColors.transparent,
              elevation: 0,
              shape: const StadiumBorder()),
          child: Text(text,
              style: TextStyle(color: AppColors.text.black, fontSize: 22.0))));
}
