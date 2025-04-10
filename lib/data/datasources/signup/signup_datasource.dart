import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pluxee_web_poc/core/constants/storage_keys.dart';
import 'package:pluxee_web_poc/core/entities/user.dart';

abstract interface class SignupDatasource {
  Future<String?> signup(User user);
}

final class SignupDatasourceImpl implements SignupDatasource {
  @override
  Future<String?> signup(User user) async {
    await Future.delayed(Duration(seconds: 2));
    final FlutterSecureStorage secureStorage = FlutterSecureStorage();
    final usersJson = await secureStorage.read(key: SecureStorageKeys.users);

    if (usersJson != null) {
      final List<dynamic> jsonList = jsonDecode(usersJson);
      final users = jsonList.map((json) => User.fromJson(json)).toList();
      if (users.any((element) => element.name == user.name)) {
        return 'User already exists';
      } else {
        users.add(user);
        secureStorage.write(
          key: SecureStorageKeys.users,
          value: jsonEncode(users),
        );
      }
    } else {
      secureStorage.write(
        key: SecureStorageKeys.users,
        value: jsonEncode([user]),
      );
    }

    return null;
  }
}
