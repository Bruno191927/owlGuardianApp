import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/core/colors/app_colors.dart';

class CustomDateTimeButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  const CustomDateTimeButton(
      {Key? key, this.icon = Icons.circle, this.text = "Fecha", this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: InkWell(
            child: Ink(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.orange),
                    borderRadius: BorderRadius.circular(16.0)),
                width: 120.0,
                height: 60.0,
                child: Row(children: [
                  Icon(icon, color: AppColors.grey),
                  const SizedBox(width: 10.0),
                  Text(text,
                      style: TextStyle(color: AppColors.grey, fontSize: 16.0))
                ])),
            onTap: onTap,
            splashColor: AppColors.orange.withOpacity(0.3)));
  }
}
