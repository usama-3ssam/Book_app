import 'package:book_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 30.0, top: 8, bottom: 8),
      child: Row(
        children: [
          Image.asset(
            AssetsData.logo,
            height: 18,
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kSearchView);
            },
            icon: Icon(
              // ignore: deprecated_member_use
              FontAwesomeIcons.search,
              size: 22,
            ),
          ),
          IconButton(
            onPressed: () {
              GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
            },
            icon: Icon(
              // ignore: deprecated_member_use
              FontAwesomeIcons.rightFromBracket,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
