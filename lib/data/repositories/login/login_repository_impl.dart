import 'package:pluxee_web_poc/core/entities/user.dart';
import 'package:pluxee_web_poc/data/datasources/login/login_datasource.dart';
import 'package:pluxee_web_poc/domain/entities/login/login_request_params.dart';
import 'package:pluxee_web_poc/domain/repositories/login/login_repository.dart';

final class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource _datasource;

  LoginRepositoryImpl({required LoginDatasource datasource})
    : _datasource = datasource;

  @override
  Future<User?> login(LoginRequestParams params) async {
    return await _datasource.login(params);
  }
}
