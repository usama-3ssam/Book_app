import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';

class CustomDetailsScreenAppBar extends StatelessWidget {
  const CustomDetailsScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
          },
          icon: Icon(
            Icons.close_rounded,
            size: 24,
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart_outlined,
            size: 24,
          ),
        ),
      ],
    );
  }
}
