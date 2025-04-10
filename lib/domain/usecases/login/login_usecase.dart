import 'package:pluxee_web_poc/core/entities/user.dart';
import 'package:pluxee_web_poc/domain/entities/login/login_request_params.dart';
import 'package:pluxee_web_poc/domain/repositories/login/login_repository.dart';

abstract interface class LoginUsecase {
  Future<User?> call(LoginRequestParams params);
}

final class LoginUsecaseImpl implements LoginUsecase {
  final LoginRepository _repository;

  LoginUsecaseImpl({required LoginRepository repository})
    : _repository = repository;
  @override
  Future<User?> call(LoginRequestParams params) => _repository.login(params);
}
