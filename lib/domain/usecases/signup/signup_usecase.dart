import 'package:pluxee_web_poc/core/entities/user.dart';
import 'package:pluxee_web_poc/domain/repositories/signup/signup_repository.dart';

abstract interface class SignupUsecase {
  Future<String?> call(User user);
}

final class SignupUsecaseImpl implements SignupUsecase {
  final SignupRepository _repository;

  SignupUsecaseImpl({required SignupRepository repository})
    : _repository = repository;

  @override
  Future<String?> call(User user) => _repository.signup(user);
}
