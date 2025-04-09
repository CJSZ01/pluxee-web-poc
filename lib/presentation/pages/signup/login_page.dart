import 'package:flutter/material.dart';
import 'package:pluxee_web_poc/core/constants/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(color: AppColors.primary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16),
                    child: Text('Username'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 8),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                      ),
                      cursorColor: AppColors.secondary,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 8),
                    child: Text('Password'),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 16),
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                          ),
                          cursorColor: AppColors.secondary,
                        ),
                      ),
                      ColoredBox(
                        color: AppColors.secondary,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
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
          ],
        ),
      ),
    );
  }
}
