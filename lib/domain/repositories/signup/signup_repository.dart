import 'package:pluxee_web_poc/core/entities/user.dart';

abstract interface class SignupRepository {
  Future<String?> signup(User user);
}
