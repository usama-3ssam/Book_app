import 'package:book_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import '../core/utils/app_router.dart';

class MyBooklyApp extends StatelessWidget {
  const MyBooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(centerTitle: true, color: kPrimaryColor),
        scaffoldBackgroundColor: kPrimaryColor,
      ),
    );
  }
}
