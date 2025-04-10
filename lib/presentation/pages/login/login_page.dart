import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluxee_web_poc/core/constants/colors.dart';
import 'package:pluxee_web_poc/core/navigation/routes.dart';
import 'package:pluxee_web_poc/presentation/pages/login/login_cubit.dart';
import 'package:pluxee_web_poc/presentation/pages/login/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late final LoginCubit _cubit;
  @override
  void initState() {
    super.initState();
    _cubit = LoginCubit();
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontWeight: FontWeight.bold);
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status == LoginPageStatus.success) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Login successful')));
          }
          if (state.error.isNotEmpty) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        bloc: _cubit,
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          border: Border.all(
                            color: AppColors.primary,
                            width: 8,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'LOGIN',
                            style: textStyle.copyWith(
                              color: Colors.white,
                              fontSize: 36,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ColoredBox(
                    color: AppColors.primary,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: 16),
                          Text('Username', style: textStyle),
                          SizedBox(height: 16),
                          TextFormField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                            ),
                            cursorColor: AppColors.primary,
                          ),
                          SizedBox(height: 16),
                          Text('Password', style: textStyle),
                          SizedBox(height: 16),
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                            ),
                            cursorColor: AppColors.secondary,
                          ),
                          SizedBox(height: 16),
                          Row(
                            // mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                color: AppColors.secondary,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      Navigation.routes.signUp,
                                    );
                                  },
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.white,
                                    size: 48,
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                color: AppColors.secondary,
                                child: IconButton(
                                  onPressed: () {
                                    _cubit.login(
                                      username: usernameController.text,
                                      password: passwordController.text,
                                    );
                                  },
                                  icon:
                                      state.status != LoginPageStatus.loading
                                          ? Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 48,
                                          )
                                          : CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
