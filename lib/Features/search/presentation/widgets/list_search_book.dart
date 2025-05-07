import 'package:book_app/Features/search/presentation/manger/search_cubit/search_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBooksListViev extends StatelessWidget {
  const SearchBooksListViev({super.key, required this.function});

  final GestureTapCallback function;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchCubitState>(
      builder: (context, state) {
        if (state is BooksLoading) {
          return CircularProgressIndicator();
        } else if (state is BooksFailure) {
          return Text(state.message);
        } else if (state is BooksSuccess || state is BooksSearchSuccess) {
          final books = state is BooksSuccess
              ? state.books
              : (state as BooksSearchSuccess).searchResults;

          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return ListTile(
                title: Text(book.volumeInfo.title ?? 'No Title'),
              );
            },
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
