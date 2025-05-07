import 'package:book_app/Features/home/presentation/widgets/similler_books_list.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        SimillerBooksListView(height: .18),
      ],
    );
  }
}
