import 'package:flutter/material.dart';
import 'custom_buttom.dart';

class ButtomsInDetailsBook extends StatelessWidget {
  const ButtomsInDetailsBook({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomButtom(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
              text: '2311',
              backgroundColor: Colors.white,
              textColor: Colors.black,
            ),
          ),
          Expanded(
            child: CustomButtom(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
              text: 'Free Preview',
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
