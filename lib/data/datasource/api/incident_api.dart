import 'package:dio/dio.dart';
import 'package:hackathon_app/data/models/incident_model.dart';

class IncidentApi{
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: '$backendHost/incident',
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      validateStatus: (_) => true,
    )
  );

  static get backendHost => null;


  Future<bool> createIncident({required IncidentModel model}) async{
    try {
      final Response response = await _dio.post('/',data: model.toJson());
      if(response.statusCode == 200){
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateIncident({required IncidentModel model}) async {
    try {
      final Response response = await _dio.put('/',data: model.toJson());
      if(response.statusCode == 200){
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

}