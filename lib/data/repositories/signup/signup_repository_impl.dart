import 'package:pluxee_web_poc/core/entities/user.dart';
import 'package:pluxee_web_poc/data/datasources/signup/signup_datasource.dart';
import 'package:pluxee_web_poc/domain/repositories/signup/signup_repository.dart';

final class SignupRepositoryImpl implements SignupRepository {
  final SignupDatasource _datasource;

  SignupRepositoryImpl({required SignupDatasource datasource})
    : _datasource = datasource;

  @override
  Future<String?> signup(User user) async {
    return await _datasource.signup(user);
  }
}
