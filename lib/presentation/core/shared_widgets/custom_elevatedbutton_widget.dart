import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final double width;
  final String text;
  final VoidCallback? onPressed;
  final Color buttonColor;
  final Color textColor;
  const CustomElevatedButton({
    Key? key,
    this.width = 250.0,
    this.text = '',
    this.onPressed,
    this.buttonColor = Colors.cyanAccent,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
      width: width,
      height: 50.0,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              primary: buttonColor, elevation: 0, shape: const StadiumBorder()),
          child:
              Text(text, style: TextStyle(color: textColor, fontSize: 22.0))));
}
