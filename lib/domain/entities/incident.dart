import 'package:hackathon_app/data/models/photo_model.dart';
import 'package:hackathon_app/data/models/user_model.dart';

class Incident{
  final String id;
  final String title;
  final double long;
  final double lat;
  final UserModel user;
  final PhotoModel image;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  Incident({
    required this.id,
    required this.title,
    required this.description,
    required this.long,
    required this.lat,
    required this.user,
    required this.image,
    required this.createdAt,
    required this.updatedAt
  });
}