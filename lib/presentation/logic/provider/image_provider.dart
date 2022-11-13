import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ImageDataProvider with ChangeNotifier{
  XFile? imgInfo = null;
  String route = "";

  void addImgInfo(XFile file){
    imgInfo = file;
    notifyListeners();
  }

  void removeImgInfo(){
    imgInfo = null;
    notifyListeners();
  }

  void addRoute(String r){
    route = r;
    notifyListeners();
  }
}