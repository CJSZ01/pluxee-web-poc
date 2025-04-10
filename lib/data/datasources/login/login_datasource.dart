import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pluxee_web_poc/core/constants/storage_keys.dart';
import 'package:pluxee_web_poc/core/entities/user.dart';
import 'package:pluxee_web_poc/domain/entities/login/login_request_params.dart';

abstract interface class LoginDatasource {
  Future<User?> login(LoginRequestParams params);
}

final class LoginDatasourceImpl implements LoginDatasource {
  @override
  Future<User?> login(LoginRequestParams params) async {
    debugPrint('login: $params');
    await Future.delayed(Duration(seconds: 2));
    final FlutterSecureStorage secureStorage = FlutterSecureStorage();
    final usersJson = await secureStorage.read(key: SecureStorageKeys.users);
    if (usersJson == null) return null;
    final List<dynamic> jsonList = jsonDecode(usersJson);
    final users = jsonList.map((json) => User.fromJson(json)).toList();
    for (final user in users) {
      if (user.name == params.userName && user.password == params.password) {
        return user;
      }
    }

    return null;
  }
}
