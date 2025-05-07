import 'package:book_app/Features/home/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'newest_seller_item.dart';

class NewestBooksListViev extends StatelessWidget {
  const NewestBooksListViev({super.key, required this.function});

  final GestureTapCallback function;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: NewestBooksItem(
                    bookModel: state.books[index],
                    function: function,
                  ),
                );
              },
              childCount: state.books.length,
            ),
          );
        } else if (state is NewestBooksFailure) {
          return Text(state.message);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
