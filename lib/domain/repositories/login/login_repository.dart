import 'package:pluxee_web_poc/core/entities/user.dart';
import 'package:pluxee_web_poc/domain/entities/login/login_request_params.dart';

abstract interface class LoginRepository {
  Future<User?> login(LoginRequestParams params);
}
