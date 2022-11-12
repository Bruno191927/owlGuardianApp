import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/views/pages/home/home_page.dart';
import 'package:hackathon_app/presentation/views/pages/request_permision/request_permission_page.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashController extends ChangeNotifier{
  final Permission _locationPermission;
  String? _routeName;
  String? get routeName => _routeName;

  SplashController(this._locationPermission);

  Future<void> checkPermission() async{
    final isGranted = await _locationPermission.isGranted;
    _routeName = isGranted ? HomePage.routeName : RequestPermissionPage.routeName;
    notifyListeners();
  }
}