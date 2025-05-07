import 'package:book_app/Features/search/presentation/widgets/list_search_book.dart';
import 'package:book_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import '../widgets/search_text_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HorizontalSpace(hight: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: SearchTextField(),
            ),
            HorizontalSpace(hight: 16),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text('Search Resalt'),
            ),
            HorizontalSpace(hight: 16),
            Expanded(
              child: SearchBooksListViev(
                function: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
