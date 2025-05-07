import 'package:book_app/core/utils/app_router.dart';
import 'package:book_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({
    super.key,
  });

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigatorToLogInView();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetsData.logo),
          SizedBox(
            height: 4,
          ),
          Text(
            'Read Free Books',
          )
        ],
      ),
    );
  }

  void navigatorToLogInView() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        // ignore: use_build_context_synchronously
        GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
      },
    );
  }
}
