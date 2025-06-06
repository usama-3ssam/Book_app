import 'package:book_app/Features/auth/data/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                context.read<AuthCubit>().logout();
                GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Login but not authorized to view books'),
                    backgroundColor: Colors.white,
                    duration: Duration(seconds: 3),
                  ),
                );
              },
            )
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: ColumnForLogInSignup(
              text1Buttom: 'Login',
              fun_1: () {
                context.read<AuthCubit>().login();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Login Success'),
                    backgroundColor: Colors.white,
                    duration: Duration(seconds: 3),
                  ),
                );
                GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
              },
            ),
          ),
        ),
      ),
    );
  }
}
