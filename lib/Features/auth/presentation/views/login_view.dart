import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';
import '../widgets/column_logIn_signup_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 10),
            child: Text(''),
          ),
          title: Text('Login'),
          actions: [
            TextButton(
              child: Text('Skip'),
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
              },
            )
          ],
        ),
        body: Center(
          child: ColumnForLogInSignup(
            text1Buttom: 'Login',
            textButtom: 'SignUp',
            fun_1: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Login Success'),
                  backgroundColor: Colors.white,
                  duration: Duration(seconds: 2),
                ),
              );

              GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
            },
            fun_2: () {
              GoRouter.of(context).pushReplacement(AppRouter.kSignupView);
            },
          ),
        ),
      ),
    );
  }
}
