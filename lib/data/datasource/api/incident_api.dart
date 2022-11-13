import 'package:dio/dio.dart';
import 'package:hackathon_app/data/datasource/local/auth.dart';
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
    final token = await Auth.instance.accessToken;
    try {
      final Response response = await _dio.post('/',data: model.toJson(),options: Options(headers: {"Auth":token}));
      if(response.statusCode == 200){
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<List<IncidentModel>> getIncidents() async{
    final token = await Auth.instance.accessToken;
    try {
      final Response response = await _dio.get('/',options: Options(headers: {"Auth":token}));
      if(response.statusCode == 200){
        final incidents = IncidentsModel.fromJsonList(response.data);
        return incidents.items;
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<bool> updateIncident({required IncidentModel model}) async {
    final token = await Auth.instance.accessToken;
    try {
      final Response response = await _dio.put('/',data: model.toJson(),options: Options(headers: {"Auth":token}));
      if(response.statusCode == 200){
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

}