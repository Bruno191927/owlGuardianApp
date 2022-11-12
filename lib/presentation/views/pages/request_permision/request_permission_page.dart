import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/views/pages/home/home_page.dart';
import 'package:hackathon_app/presentation/views/pages/request_permision/request_premision_controller.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestPermissionPage extends StatefulWidget {
  static const routeName = "requestPermision";
  const RequestPermissionPage({ Key? key }) : super(key: key);

  @override
  _RequestPermissionPageState createState() => _RequestPermissionPageState();
}

class _RequestPermissionPageState extends State<RequestPermissionPage> with WidgetsBindingObserver{

  final _controller = RequestPermissionController(Permission.locationWhenInUse);
  late StreamSubscription _subscription;
  bool _fromSettings = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    _subscription = _controller.onStatusChanged.listen(
      (status) {
        switch (status) {
          case PermissionStatus.granted:
            _goToHome();
          break;
          case PermissionStatus.permanentlyDenied:
            showDialog(
              context: context, 
              builder: (_) => AlertDialog(
                title: const Text("Info"),
                content: const Text("Debes dar permiso a la ubicación"),
                actions: [
                  TextButton(
                    onPressed: () async{
                      Navigator.pop(context);
                      _fromSettings = await openAppSettings();
                    }, 
                    child: const Text('Ir')
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    }, 
                    child: const Text('Cancelar')
                  )
                ],
              )
            );
          break;
          default:
        }
      }
    );
  }


  //al momento de solicitar permisos fuera de la app en la opcion settings
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async{
    if(state == AppLifecycleState.resumed && _fromSettings){
      final status = await _controller.check();
      if(status == PermissionStatus.granted){
        _goToHome();
      }
    }
    _fromSettings = false;
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    _subscription.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _goToHome(){
    Navigator.pushReplacementNamed(context, HomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: ElevatedButton(
            child: const Text("Allow"),
            onPressed: (){
              _controller.request();
            },
          ),
        ),
      ),
    );
  }
}