import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff100B20);
const kTranstionDuration = Duration(milliseconds: 250);
const kGtSectraFine = 'GT Sectra Fine';

// ignore: must_be_immutable
class HorizontalSpace extends StatelessWidget {
  HorizontalSpace({
    super.key,
    required this.hight,
  });
  double hight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hight,
    );
  }
}

// ignore: must_be_immutable
class VerticalSpace extends StatelessWidget {
  VerticalSpace({
    super.key,
    required this.width,
  });
  double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
