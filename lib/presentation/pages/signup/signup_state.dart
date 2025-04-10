enum SignupPageStatus { initial, loading, success }

final class SignupState {
  final String userName;
  final String password;
  final String passwordConfirm;
  final bool showPassword;
  final String error;
  final SignupPageStatus status;

  SignupState({
    required this.userName,
    required this.password,
    required this.passwordConfirm,
    required this.showPassword,
    required this.error,
    required this.status,
  });

  SignupState.initial({
    this.userName = '',
    this.password = '',
    this.passwordConfirm = '',
    this.showPassword = false,
    this.error = '',
    this.status = SignupPageStatus.initial,
  });

  SignupState copyWith({
    String? userName,
    String? password,
    String? passwordConfirm,
    bool? showPassword,
    String? error,
    SignupPageStatus? status,
  }) => SignupState(
    userName: userName ?? this.userName,
    password: password ?? this.password,
    passwordConfirm: passwordConfirm ?? this.password,
    showPassword: showPassword ?? this.showPassword,
    error: error ?? this.error,
    status: status ?? this.status,
  );
}
