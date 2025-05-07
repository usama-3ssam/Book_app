import 'package:book_app/Features/home/data/models/book_model/book_model.dart';
import 'package:book_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'books_details_actions.dart';
import 'custom_details_screen_app_bar.dart';
import 'similler_books_section.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                CustomDetailsScreenAppBar(),
                BooksDetailsActions(
                  bookModel: bookModel,
                ),
                Expanded(child: HorizontalSpace(hight: 50)),
                SimilarBooksSection(),
                HorizontalSpace(hight: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
