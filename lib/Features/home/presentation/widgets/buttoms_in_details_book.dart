// ignore_for_file: avoid_print
import 'package:book_app/Features/auth/data/auth_cubit.dart';
import 'package:book_app/Features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'custom_buttom.dart';

class ButtomsInDetailsBook extends StatelessWidget {
  const ButtomsInDetailsBook({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;
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
              text: 'Free',
              backgroundColor: Colors.white,
              textColor: Colors.black,
            ),
          ),
          Expanded(
            child: CustomButtom(
              onPressed: () async {
                final isLoggedIn = context.read<AuthCubit>().state.isLoggedIn;
                print('Current login status: $isLoggedIn');
                if (isLoggedIn) {
                  print('User is logged in');
                  Uri uri = Uri.parse(bookModel.volumeInfo.previewLink!);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  } else {
                    print('Cannot launch URL');
                  }
                } else {
                  print('User is NOT logged in');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.white,
                      content: Text(
                          'Cannot launch URL, Please login to view the book.'),
                    ),
                  );
                }
              },
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              text: 'Preview',
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
