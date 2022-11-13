import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/core/colors/app_colors.dart';

class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet({Key? key}) : super(key: key);

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  final DateTime _pubDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15.0),
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
            child: Column(children: [
          Text("INCIDENCIA",
              style: TextStyle(
                  color: AppColors.orange,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 20.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            height: 40.0,
          ),
          const SizedBox(height: 20.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.centerLeft,
            child: const Text("Título",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 10.0),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              width: double.infinity,
              child: const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15.0),
              )),
          const SizedBox(height: 10.0),
          Card(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset("assets/no_image.png"),
          )),
          const SizedBox(height: 5.0),
          Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "${_pubDate.year}-${_pubDate.month}-${_pubDate.day}",
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 15.0),
              ))
        ])));
  }
}
