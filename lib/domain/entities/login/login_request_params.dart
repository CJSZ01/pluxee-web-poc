final class LoginRequestParams {
  final String userName;
  final String password;

  LoginRequestParams({required this.userName, required this.password});

  Map<String, dynamic> toMap() => {'userName': userName, 'password': password};

  @override
  String toString() =>
      'LoginRequestParams(userName: $userName, password: $password)';
}
