import 'package:flutter/material.dart';
import 'package:pluxee_web_poc/presentation/pages/login/login_page.dart';
import 'package:pluxee_web_poc/presentation/pages/signup/signup_page.dart';

final class Navigation {
  Navigation._();
  static final routes = _Routes();
  static Map<String, WidgetBuilder> get routing => {
    routes.login: (_) => LoginPage(),
    routes.signUp: (_) => SignupPage(),
  };
}

final class _Routes {
  final String login = '/';
  final String signUp = '/sign_up';
}
