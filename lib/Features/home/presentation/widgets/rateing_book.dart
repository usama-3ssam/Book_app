import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/styles.dart';

class RateBook extends StatelessWidget {
  const RateBook(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.center,
      required this.rating,
      required this.count});
  final MainAxisAlignment mainAxisAlignment;

  final int rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Color(0xffFFDD4F),
        ),
        VerticalSpace(width: 6.3),
        Text(
          rating.toString(),
          style: Styles.textStyle20.copyWith(
            fontSize: 18,
          ),
        ),
        VerticalSpace(width: 5),
        Text(
          '($count)',
          style: Styles.textStyle20.copyWith(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
