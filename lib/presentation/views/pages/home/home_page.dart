import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackathon_app/presentation/views/pages/home/home_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const routeName = "home";
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<HomeController>(
      create: (_) {
        final controller = HomeController();
        controller.onMarkerTap.listen((String id) {
          //print("Got to $id");
        });
        return controller;
      },
      child: Scaffold(
        body: Selector<HomeController, bool>(
          selector: (_, controller) => controller.loading,
          builder: (context, loading, loadingWidget) {
            if (loading) {
              return loadingWidget!;
            }
            return Consumer<HomeController>(
                builder: (_, controller, gpsMessage) {
                  if (!controller.gpsEnable) {
                    return gpsMessage!;
                  } else {
                    return Stack(
                      children: [
                        GoogleMap(
                          onMapCreated: controller.onMapCreated,
                          myLocationButtonEnabled: false,
                          zoomControlsEnabled: false,
                          compassEnabled: false,
                          initialCameraPosition:controller.initialCameraPosition,
                          markers: controller.markers,
                          onTap: controller.onTap,
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 50),
                                height: 80,
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        width: size.width * 0.85,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:BorderRadius.circular(40),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black26,
                                              offset: Offset(1, 1),
                                              blurRadius: 6
                                            )
                                          ]
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: size.width * 0.15,
                                              child: IconButton(
                                                icon: const Icon(Icons.home),
                                                onPressed: () {},
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.15,
                                              child: IconButton(
                                                icon: const Icon(Icons.home),
                                                onPressed: () {},
                                              ),
                                            ),
                                            const Spacer(),
                                            SizedBox(
                                              width: size.width * 0.15,
                                              child: IconButton(
                                                icon: const Icon(Icons.home),
                                                onPressed: () {},
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.15,
                                              child: IconButton(
                                                icon: const Icon(Icons.home),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          color: (controller.dialogEnabled)?Colors.white:Colors.red,
                                          borderRadius: BorderRadius.circular(70),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(1, 1),
                                                blurRadius: 6)
                                          ]
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        //Aqui hacer tu panel
                      ],
                    );
                  }
                },
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Por favor activa tu gps'),
                      ElevatedButton(
                        onPressed: () {
                          //usa el context del selector
                          final controller = context.read<HomeController>();
                          controller.turnOnGps();
                        },
                        child: const Text('Turn on GPS'),
                      )
                    ],
                  ),
                ));
          },
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
