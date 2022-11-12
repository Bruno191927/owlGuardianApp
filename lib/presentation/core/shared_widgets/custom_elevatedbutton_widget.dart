import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final double width;
  final String text;
  const CustomElevatedButton({Key? key, this.width = 250.0, this.text = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
      width: width,
      height: 50.0,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              primary: Colors.cyanAccent,
              shadowColor: Colors.transparent,
              elevation: 0,
              shape: const StadiumBorder()),
          child: Text(text,
              style: const TextStyle(color: Colors.black, fontSize: 22.0))));
}
