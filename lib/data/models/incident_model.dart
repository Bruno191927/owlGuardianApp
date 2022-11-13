import 'package:hackathon_app/data/models/photo_model.dart';
import 'package:hackathon_app/data/models/user_model.dart';
import 'package:hackathon_app/domain/entities/incident.dart';


class IncidentsModel{
  List<IncidentModel> items = [];
  IncidentsModel();
  IncidentsModel.fromJsonList(List<dynamic> jsonList){
    if(jsonList.isEmpty) return ;
    for (var item in jsonList) {
      final incidentData = IncidentModel.fromJson(item);
      items.add(incidentData);
    }
  }
}

class IncidentModel extends Incident{
  IncidentModel({
    required String id,
    required UserModel user,
    required String title,
    required double long,
    required double lat,
    required PhotoModel image,
    required String description,
    required DateTime createdAt,
    required DateTime updatedAt
  }) : super(
    id: id,
    title: title,
    lat: lat,
    long: long,
    description: description,
    image: image,
    createdAt: createdAt,
    updatedAt: updatedAt,
    user: user
  );


  factory IncidentModel.fromJson(Map<String,dynamic> json){
    return IncidentModel(
      id: json["id"],
      title: json["title"],
      user: UserModel.fromJson(json["user"]),
      long: json["long"], 
      lat: json["lat"], 
      image: PhotoModel.fromJson(json["image"]), 
      description: json["description"], 
      createdAt: DateTime.parse("createdAt"), 
      updatedAt: DateTime.parse("updatedAt")
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "title":title,
      "lat":lat,
      "long":long,
      "description":description,
      "image":image.toJson(),
    };
  }
}