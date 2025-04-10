import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluxee_web_poc/core/entities/user.dart';
import 'package:pluxee_web_poc/data/datasources/signup/signup_datasource.dart';
import 'package:pluxee_web_poc/data/repositories/signup/signup_repository_impl.dart';
import 'package:pluxee_web_poc/domain/usecases/signup/signup_usecase.dart';
import 'package:pluxee_web_poc/presentation/pages/signup/signup_state.dart';

final class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState.initial());
  final SignupUsecase _signupUsecase = SignupUsecaseImpl(
    repository: SignupRepositoryImpl(datasource: SignupDatasourceImpl()),
  );

  void signup({
    required String username,
    required String password,
    required String passwordConfirm,
  }) async {
    emit(state.copyWith(status: SignupPageStatus.loading, error: ''));
    if (username.isEmpty || password.isEmpty || (passwordConfirm != password)) {
      emit(
        state.copyWith(
          status: SignupPageStatus.initial,
          error: 'Please fill out all fields',
        ),
      );
      return;
    }
    final response = await _signupUsecase(
      User(name: username, password: password),
    );
    if (response == null) {
      emit(state.copyWith(status: SignupPageStatus.success));
    } else {
      emit(state.copyWith(status: SignupPageStatus.initial, error: response));
    }
  }
}
