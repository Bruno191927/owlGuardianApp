import 'package:hackathon_app/data/datasource/api/incident_api.dart';
import 'package:hackathon_app/data/models/incident_model.dart';
import 'package:hackathon_app/domain/repositories/incident_repository.dart';

class IncidentRepositoryImpl implements IncidentRepository{

  final IncidentApi _api;
  IncidentRepositoryImpl(this._api);

  @override
  Future<bool> createIncident({required IncidentModel model}) {
    return _api.createIncident(model: model);
  }

  @override
  Future<List<IncidentModel>> getIncidents() {
    return _api.getIncidents();
  }

  @override
  Future<bool> updateIncident({required IncidentModel model}) {
    return _api.updateIncident(model: model);
  }

}