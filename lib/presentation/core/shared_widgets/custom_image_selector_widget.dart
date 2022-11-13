import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/core/colors/app_colors.dart';

class CustomImageSelectorWidget extends StatefulWidget {
  final VoidCallback? function;
  const CustomImageSelectorWidget({ Key? key,this.function}) : super(key: key);

  @override
  State<CustomImageSelectorWidget> createState() => _CustomImageSelectorWidgetState();
}

class _CustomImageSelectorWidgetState extends State<CustomImageSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.function,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.orange),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_photo_alternate,color: AppColors.orange,size: 40,),
              Text('Agrega una foto',style: TextStyle(color: AppColors.orange),)
            ],
          )
        ),
      ),
    );
  }
}