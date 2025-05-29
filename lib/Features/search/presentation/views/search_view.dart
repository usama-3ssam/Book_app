import 'package:book_app/Features/search/presentation/manger/search_cubit/search_cubit_cubit.dart';
import 'package:book_app/Features/search/presentation/widgets/list_search_book.dart';
import 'package:book_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/search_text_field.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    super.initState();
    context.read<SearchCubit>().fetchBooks();
  }

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
              child: Text('Search Result'),
            ),
            HorizontalSpace(hight: 16),
            Expanded(
              child: SearchBooksListView(
                function: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
