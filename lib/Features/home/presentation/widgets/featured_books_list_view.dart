// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:book_app/Features/home/data/models/book_model/book_model.dart';
import 'package:book_app/Features/home/manger/feature_books_cubit/feature_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_item_view.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({
    super.key,
    required this.height,
    this.function,
  });

  final void Function(BookModel)? function;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: BlocBuilder<FeatureBooksCubit, FeatureBooksState>(
        builder: (context, state) {
          if (state is FeatureBooksSuccess) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * height,
              child: ListView.builder(
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final book = state.books[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      right: 10.0,
                    ),
                    child: CustomBookImage(
                      function: () {
                        if (function != null) function!(book);
                      },
                      imgUrl:
                          state.books[index].volumeInfo.imageLinks.thumbnail,
                    ),
                  );
                },
              ),
            );
          } else if (state is FeatureBooksFailuer) {
            return Text(state.message);
          } else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
