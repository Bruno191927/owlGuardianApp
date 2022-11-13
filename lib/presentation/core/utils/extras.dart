import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
class Extras{
  static pickImage(bool fromCamera) async{
    final ImagePicker picker = ImagePicker();
    final XFile? file = (await picker.pickImage(
      source:fromCamera?ImageSource.camera:ImageSource.gallery
    )) as XFile;
      return file;
  }

  static Future<PlatformFile?> pickedFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      dialogTitle: 'Escoge una imagen',
      type: FileType.image,
      allowedExtensions: ['jpg','jpeg','gif','png']
    );
    if(result== null) return null;
    PlatformFile file = result.files.single;
    //final bytes = await File(file.path!).readAsBytes();
    //return bytes;
    return file;
  }

   static getFileName(String path){
    return basename(path);
  }
}