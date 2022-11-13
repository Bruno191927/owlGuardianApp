import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackathon_app/presentation/core/colors/app_colors.dart';
import 'package:hackathon_app/presentation/views/pages/home/home_controller.dart';
import 'package:hackathon_app/presentation/views/pages/notifications/notifications_page.dart';
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
                          initialCameraPosition:
                              controller.initialCameraPosition,
                          markers: controller.markers,
                          onTap: (LatLng position) {
                            controller.onTap(position, context);
                          },
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 50),
                                height: 100,
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        width: size.width * 0.85,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black26,
                                                  offset: Offset(1, 1),
                                                  blurRadius: 4)
                                            ]),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: size.width * 0.15,
                                              child: IconButton(
                                                icon: const Icon(
                                                    Icons.podcasts_outlined),
                                                onPressed: () {},
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.15,
                                              child: IconButton(
                                                icon: const Icon(Icons.person),
                                                onPressed: () {
                                                  controller.profile(context);
                                                },
                                              ),
                                            ),
                                            const Spacer(),
                                            SizedBox(
                                              width: size.width * 0.15,
                                              child: IconButton(
                                                icon: const Icon(
                                                    Icons.notifications),
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context,
                                                      NotificationsPage
                                                          .routeName);
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.15,
                                              child: IconButton(
                                                icon:
                                                    const Icon(Icons.settings),
                                                onPressed: () {
                                                  controller.settings(context);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: GestureDetector(
                                        onTap: () =>
                                            controller.incidence(context),
                                        child: Container(
                                          height: 55,
                                          width: 55,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Colors.black54,
                                                    offset: Offset(0, 0),
                                                    blurRadius: 3),
                                              ],
                                              gradient: LinearGradient(
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.topCenter,
                                                  colors: [
                                                    const Color(0xFFDDA766),
                                                    AppColors.orange,
                                                  ])),
                                          margin: const EdgeInsets.only(
                                              bottom: 30.0),
                                          child: RotatedBox(
                                              quarterTurns: 3,
                                              child: Icon(
                                                Icons.double_arrow_outlined,
                                                size: 38.0,
                                                color: AppColors.white,
                                              )),
                                        ),
                                      ),
                                    ),
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

  buildBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(height: 300.0);
      },
      backgroundColor: AppColors.orange,
      barrierColor: AppColors.red,
    );
  }
}
