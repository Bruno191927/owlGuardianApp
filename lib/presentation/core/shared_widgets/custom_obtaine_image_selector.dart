import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/logic/provider/image_provider.dart';

class CustomObtainedImageSelector extends StatefulWidget {
  final ImageDataProvider provider;
  const CustomObtainedImageSelector({ Key? key,required this.provider}) : super(key: key);
  @override
  State<CustomObtainedImageSelector> createState() => _CustomObtainedImageSelectorState();
}

class _CustomObtainedImageSelectorState extends State<CustomObtainedImageSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: (widget.provider.imgInfo != null)?BoxDecoration(
        image: DecorationImage(
          image: FileImage(File(widget.provider.imgInfo!.path)),
          fit: BoxFit.fill
        ),
        borderRadius: BorderRadius.circular(20)
      ):BoxDecoration(),
    );
  }
}