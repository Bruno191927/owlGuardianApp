import 'package:hackathon_app/data/models/user_model.dart';

class User{
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String cellPhone;
  final String documentNumber;
  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.cellPhone,
    required this.documentNumber
  });
}