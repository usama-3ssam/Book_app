// ignore_for_file: file_namesl, deprecated_member_use
import 'package:book_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/widgets.dart';

class ColumnForLogInSignup extends StatelessWidget {
  ColumnForLogInSignup({
    super.key,
    required this.text1Buttom,
    required this.fun_1,
  });

  final String text1Buttom;
  final VoidCallback fun_1;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AssetsData.logo,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            HorizontalSpace(
              hight: 20,
            ),
            CustomTextField(
              validat: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegex.hasMatch(value)) {
                  return 'Please enter a valid email address';
                }

                return null;
              },
              hint: "username",
              radius: 10,
            ),
            HorizontalSpace(
              hight: 20,
            ),
            CustomTextField(
              validat: (value) => value == null || value.isEmpty
                  ? 'Please enter your password'
                  : value.length < 6
                      ? 'Password must be at least 6 characters'
                      : null,
              hint: "psaaword",
              radius: 10,
            ),
            HorizontalSpace(
              hight: 20,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 50,
              minWidth: double.infinity,
              color: Colors.white.withOpacity(.5),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  fun_1();
                }
              },
              child: Text(
                text1Buttom,
                style: TextStyle(color: kPrimaryColor, fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
