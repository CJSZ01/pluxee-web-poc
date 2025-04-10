enum LoginPageStatus { initial, loading, success }

final class LoginState {
  final String userName;
  final String password;
  final bool showPassword;
  final String error;
  final LoginPageStatus status;

  LoginState({
    required this.userName,
    required this.password,
    required this.showPassword,
    required this.error,
    required this.status,
  });

  LoginState.initial({
    this.userName = '',
    this.password = '',
    this.showPassword = false,
    this.error = '',
    this.status = LoginPageStatus.initial,
  });

  LoginState copyWith({
    String? userName,
    String? password,
    bool? showPassword,
    String? error,
    LoginPageStatus? status,
  }) => LoginState(
    userName: userName ?? this.userName,
    password: password ?? this.password,
    showPassword: showPassword ?? this.showPassword,
    error: error ?? this.error,
    status: status ?? this.status,
  );
}
