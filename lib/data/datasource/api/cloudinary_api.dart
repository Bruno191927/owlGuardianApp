import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_app/data/models/photo_model.dart';
import 'package:hackathon_app/presentation/core/colors/app_colors.dart';
import 'package:hackathon_app/presentation/core/utils/extras.dart';
import 'package:hackathon_app/presentation/core/utils/progress_dialog.dart';

class PhotoAPI {
  PhotoAPI._internal();
  static final PhotoAPI _instance = PhotoAPI._internal();
  static PhotoAPI get instance => _instance;

  final Dio _dio = Dio();

  Future<PhotoModel?> uploadPhoto(
    Uint8List? bytes, String filePath, BuildContext context) async {
    final ProgressDialog progressDialog = ProgressDialog(context);
    progressDialog.show();
    try {
      FormData formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(bytes!,filename: Extras.getFileName(filePath))
      });
      final Response response = await _dio.post('https://api.cloudinary.com/v1_1/do9yplt9g/image/upload?upload_preset=tpcljwnd',
        data: formData,
        options: Options(
          headers: {'content-type': 'multipart/form-data'}
        )
      );
      progressDialog.dismiss();
      PhotoModel photoModel = PhotoModel(publicId: response.data['public_id'],secureUrl: response.data['secure_url']);
      return photoModel;
    } catch (e) {
      progressDialog.dismiss();
      if (e is DioError) {
        print(e.response!.data);
      }
      print("Error ${e.toString()}");
      return null;
    }
  }
}