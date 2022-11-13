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
    UserModel? user,
    required String title,
    required String category,
    required double long,
    required double lat,
    required String timeOfIncident,
    PhotoModel? image,
    required String description,
    required DateTime createdAt,
    required DateTime updatedAt
  }) : super(
    id: id,
    title: title,
    category: category,
    lat: lat,
    long: long,
    description: description,
    image: image,
    createdAt: createdAt,
    updatedAt: updatedAt,
    user: user,
    timeOfIncident:timeOfIncident
  );


  factory IncidentModel.fromJson(Map<String,dynamic> json){
    return IncidentModel(
      id: json["id"],
      title: json["title"],
      timeOfIncident:json["timeOfIncident"],
      category: json["category"],
      user: json["user"] != null ? UserModel.fromJson(json["user"]) : null,
      long: json["long"], 
      lat: json["lat"], 
      image: json["image"] != null ? PhotoModel.fromJson(json["image"]) : null, 
      description: json["description"], 
      createdAt: DateTime.parse("createdAt"), 
      updatedAt: DateTime.parse("updatedAt")
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title":title,
      "lat":lat,
      "category":category,
      "timeOfIncident":timeOfIncident,
      "long":long,
      "description":description,
      "image":(image != null) ? image!.toJson() : null,
    };
  }
}