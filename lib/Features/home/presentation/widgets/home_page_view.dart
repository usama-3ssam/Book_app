import 'package:book_app/Features/home/presentation/widgets/custom_app_bar.dart';
import 'package:book_app/Features/home/presentation/widgets/newest_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/styles.dart';
import '../../manger/newest_books_cubit/newest_books_cubit.dart';
import 'featured_books_list_view.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NewestBooksFailure) {
          return Center(child: Text('Error: ${state.message}'));
        } else if (state is NewestBooksSuccess) {
          final books = state.books;

          return CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(),
                    FeaturedBooksListView(height: .3),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 30,
                      ),
                      child: Text(
                        'Newest Book',
                        style: Styles.textStyle18,
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final book = books[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      child: NewestBooksItem(
                        bookModel: book,
                        function: () {
                          GoRouter.of(context)
                              .push(AppRouter.kBookDetailsView, extra: book);
                        },
                      ),
                    );
                  },
                  childCount: books.length,
                ),
              ),
            ],
          );
        } else {
          return const SizedBox(); // fallback state
        }
      },
    );
  }
}
