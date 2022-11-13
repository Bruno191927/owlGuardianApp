import 'package:hackathon_app/domain/entities/incident.dart';

class IncidentModel extends Incident{
  IncidentModel({
    required String id
  }) : super(id: id);

  Map<String, dynamic> toJson() {
    return {
      "id":id 
    };
  }
}