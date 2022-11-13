abstract class AuthRepository{
  Future<bool> login({required String email,required String password});

  Future<bool> singin({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String cellPhone,
    required String documentNumber,
  });
}