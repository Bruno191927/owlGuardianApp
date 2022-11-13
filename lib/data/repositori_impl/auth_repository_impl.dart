import 'package:hackathon_app/data/datasource/api/auth_api.dart';
import 'package:hackathon_app/domain/repositories/auth_respository.dart';

class AuthRepositoryImpl implements AuthRepository{

  final AuthApi _api;
  AuthRepositoryImpl(this._api);

  @override
  Future<bool> login({required String email, required String password}) {
    return _api.login(email: email, password: password);
  }

  @override
  Future<bool> singin({required String email, required String password, required String firstName, required String lastName, required String cellPhone, required String documentNumber}) {
    return _api.signIn(email: email, password: password, firstName: firstName, lastName: lastName, cellPhone: cellPhone, documentNumber: documentNumber);
  }

}