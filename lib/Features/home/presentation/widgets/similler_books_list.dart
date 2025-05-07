// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:book_app/Features/home/manger/similler_books_cubit/similler_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_item_view.dart';

class SimillerBooksListView extends StatelessWidget {
  const SimillerBooksListView({
    super.key,
    required this.height,
  });
  final double height;
  // final BookModel books;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: BlocBuilder<SimillerBooksCubit, SimillerBooksState>(
        builder: (context, state) {
          if (state is SimillerBooksSuccess) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * height,
              child: ListView.builder(
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: 10.0,
                    ),
                    child: CustomBookImage(
                      imgUrl:
                          state.books[index].volumeInfo.imageLinks.thumbnail,
                    ),
                  );
                },
              ),
            );
          } else if (state is SimillerBooksFailuer) {
            return Text(state.message);
          } else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
