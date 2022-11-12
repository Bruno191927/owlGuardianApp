import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  static const routeName = "home";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cameraPosition =
      const CameraPosition(target: LatLng(-11.9358674, -76.6983514), zoom: 15);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      children: [
        GoogleMap(
          initialCameraPosition: cameraPosition,
        ),
        Center(
          child: Container(
            child: Column(
              children: [
                Container(
                  width: size.width * 0.8,
                  height: size.height * 0.3,
                  color: Colors.amber,
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
