import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluxee_web_poc/data/datasources/login/login_datasource.dart';
import 'package:pluxee_web_poc/data/repositories/login/login_repository_impl.dart';
import 'package:pluxee_web_poc/domain/entities/login/login_request_params.dart';
import 'package:pluxee_web_poc/domain/usecases/login/login_usecase.dart';
import 'package:pluxee_web_poc/presentation/pages/login/login_state.dart';

final class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());
  final LoginUsecase _loginUsecase = LoginUsecaseImpl(
    repository: LoginRepositoryImpl(datasource: LoginDatasourceImpl()),
  );
  void login({required String username, required String password}) async {
    emit(state.copyWith(status: LoginPageStatus.loading, error: ''));
    final response = await _loginUsecase(
      LoginRequestParams(userName: username, password: password),
    );
    if (response != null) {
      emit(state.copyWith(status: LoginPageStatus.success, error: ''));
    } else {
      emit(
        state.copyWith(
          status: LoginPageStatus.initial,
          error: 'Failed to login. Please verify your credentials.',
        ),
      );
    }
  }
}
