import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluxee_web_poc/core/constants/colors.dart';
import 'package:pluxee_web_poc/presentation/pages/signup/signup_cubit.dart';
import 'package:pluxee_web_poc/presentation/pages/signup/signup_state.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  late final SignupCubit _cubit;
  @override
  void initState() {
    super.initState();
    _cubit = SignupCubit();
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontWeight: FontWeight.bold);
    return BlocConsumer<SignupCubit, SignupState>(
      bloc: _cubit,
      listener: (context, state) {
        if (state.status == SignupPageStatus.success) {
          Navigator.pop(context);
        }
        if (state.error.isNotEmpty) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.secondary,
          body: Center(
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
                            'SIGNUP',
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
                            cursorColor: AppColors.secondary,
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
                          Text('Confirm Password', style: textStyle),
                          SizedBox(height: 16),
                          TextFormField(
                            controller: confirmPasswordController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                            ),
                            cursorColor: AppColors.secondary,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                color: AppColors.secondary,
                                child: IconButton(
                                  onPressed: () {
                                    if (state.status !=
                                        SignupPageStatus.loading) {
                                      _cubit.signup(
                                        username: usernameController.text,
                                        password: passwordController.text,
                                        passwordConfirm:
                                            confirmPasswordController.text,
                                      );
                                    }
                                  },
                                  icon:
                                      state.status != SignupPageStatus.loading
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
                              Container(
                                width: 100,
                                height: 100,
                                color: AppColors.secondary,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_sharp,
                                    color: Colors.white,
                                    size: 48,
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
          ),
        );
      },
    );
  }
}
