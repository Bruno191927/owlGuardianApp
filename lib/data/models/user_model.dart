import 'package:hackathon_app/domain/entities/user.dart';

class UserModel extends User{
  UserModel({
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    required String cellPhone,
    required String documentNumber,
  }) : super(
    id: id,
    email: email,
    firstName: firstName,
    lastName: lastName,
    cellPhone: cellPhone,
    documentNumber: documentNumber
  );

  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
      id: json["id"],
      email: json["email"], 
      firstName: json["firstName"], 
      lastName: json["lastName"], 
      cellPhone: json["cellPhone"], 
      documentNumber: json["documentNumber"]
    );
  }
}