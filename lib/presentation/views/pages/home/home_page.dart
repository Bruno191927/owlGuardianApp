import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackathon_app/presentation/views/pages/home/home_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const routeName = "home";
  const HomePage({Key? key}) : super (key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeController>(
      create: (_){
        final controller = HomeController();
        controller.onMarkerTap.listen((String id) {
            //print("Got to $id");
         });
        return controller;
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffFD5D21),
          onPressed: (){

          },
          child: Icon(
            Icons.keyboard_arrow_up_sharp
          ),
        ),
        body: Stack(
          children: [
            Selector<HomeController,bool>(
              selector: (_,controller) => controller.loading,
              builder: (context,loading,loadingWidget){
                if(loading){
                  return loadingWidget!;
                }
                return Consumer<HomeController>(
                  builder: (_,controller,gpsMessage){
                    if(!controller.gpsEnable){
                      return gpsMessage!;
                    }
                    else{
                      return GoogleMap(
                        onMapCreated: controller.onMapCreated,
                        myLocationButtonEnabled: false,
                        zoomControlsEnabled: false,
                        compassEnabled: false,
                        initialCameraPosition: controller.initialCameraPosition,
                        markers: controller.markers,
                        onTap: controller.onTap,
                      );
                    }
                  },
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Por favor activa tu gps'),
                        ElevatedButton(
                          onPressed: (){
                            //usa el context del selector
                            final controller = context.read<HomeController>();
                            controller.turnOnGps();
                          },
                          child:const Text('Turn on GPS'),
                        )
                      ],
                    ),
                  )
                );
              },
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        )
      ),
    );
  }
}