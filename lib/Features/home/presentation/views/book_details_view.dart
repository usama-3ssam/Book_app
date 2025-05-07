import 'package:book_app/Features/home/data/models/book_model/book_model.dart';
import 'package:book_app/Features/home/manger/similler_books_cubit/similler_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/book_details_view_widget.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.books});
  final BookModel books;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimillerBooksCubit>(context)
        .feachSimillerBooks(category: widget.books.volumeInfo.categories![0]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: BookDetails(
            bookModel: widget.books,
          ),
        ),
      ),
    );
  }
}
