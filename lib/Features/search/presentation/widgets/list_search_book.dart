import 'package:book_app/Features/home/presentation/widgets/custom_item_view.dart';
import 'package:book_app/Features/search/presentation/manger/search_cubit/search_cubit_cubit.dart';
import 'package:book_app/core/utils/app_router.dart';
import 'package:book_app/core/utils/constants.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchBooksListView extends StatelessWidget {
  const SearchBooksListView({super.key, required this.function});

  final GestureTapCallback function;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchCubitState>(
      builder: (context, state) {
        if (state is BooksLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is BooksFailure) {
          return Text(state.message);
        } else if (state is BooksSearchEmpty) {
          return Center(child: Text('Start typing to search...'));
        } else if (state is BooksSuccess || state is BooksSearchSuccess) {
          final books = state is BooksSuccess
              ? state.books
              : (state as BooksSearchSuccess).books;

          if (books.isEmpty) {
            return Center(child: Text('No results found'));
          }

          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .push(AppRouter.kBookDetailsView, extra: book);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        CustomBookImage(
                          imgUrl: book.volumeInfo.imageLinks.thumbnail,
                        ),
                        VerticalSpace(width: 30),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .5,
                                child: Text(
                                  book.volumeInfo.title!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Styles.textStyle20.copyWith(
                                    fontFamily: kGtSectraFine,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Text(
                                book.volumeInfo.authors![0],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Styles.textStyle14,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
