import 'package:flutter/material.dart';

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
            Navigator.pop(context);
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
