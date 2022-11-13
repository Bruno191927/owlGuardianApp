import 'package:dio/dio.dart';
import 'package:hackathon_app/data/datasource/local/auth.dart';
import 'package:hackathon_app/presentation/core/enviroment_config/enviroment_config.dart';

class AuthApi{
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: '$backendHost/auth',
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      validateStatus: (_) => true,
    )
  );

  Future<bool> login({required String email,required String password}) async{
    try {
      final Response response = await _dio.post('/login',data: {
        'email':email,
        'password':password
      });

      print(response.data);


      if(response.statusCode == 200){
        await Auth.instance.setSesion(response.data);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }


  Future<bool> signIn({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String cellPhone,
    required String documentNumber,
  }) async{
    try {

      final Response response = await _dio.post('/signin',data:{
        "email":email,
        "password":password,
        "firstName":firstName,
        "lastName":lastName,
        "cellPhone":cellPhone,
        "documentNumber":documentNumber
      });
      if(response.statusCode == 200){
        await Auth.instance.setSesion(response.data);
        return true;
      }


      return false;
    } catch (e) {
      return false;
    }
  }
}