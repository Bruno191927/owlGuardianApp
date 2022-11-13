import 'package:hackathon_app/data/models/incident_model.dart';

abstract class IncidentRepository{
  Future<bool> createIncident({required IncidentModel model});

  Future<List<IncidentModel>> getIncidents();

  Future<bool> updateIncident({required IncidentModel model});
}