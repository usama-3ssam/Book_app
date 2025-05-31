import 'package:book_app/Features/auth/data/auth_cubit.dart';
import 'package:book_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(BlocProvider<AuthCubit>(
    create: (_) => AuthCubit(),
    child: const MyBooklyApp(),
  ));
}
