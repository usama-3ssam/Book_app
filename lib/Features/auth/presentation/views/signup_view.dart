import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';
import '../widgets/column_logIn_signup_widget.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 10),
            child: Text(''),
          ),
          title: Text('SignUp'),
        ),
        body: Center(
          child: ColumnForLogInSignup(
            textButtom: 'Login',
            text1Buttom: 'SignUp',
            fun_1: () {
              GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
            },
            fun_2: () {
              GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
            },
          ),
        ),
      ),
    );
  }
}
