import 'package:bloc/bloc.dart';
import 'package:book_app/Features/home/data/models/book_model/book_model.dart';
import 'package:book_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
part 'search_cubit_state.dart';

class SearchCubit extends Cubit<SearchCubitState> {
  SearchCubit(this.booksRepo) : super(SearchCubitInitial());

  final HomeRepo booksRepo;
  List<BookModel> _allBooks = [];

  Future<void> fetchBooks() async {
    emit(BooksLoading());
    final result = await booksRepo.featchFeaturedBooks();
    result.fold(
      (failure) => emit(BooksFailure(failure.errMessage)),
      (books) {
        _allBooks = books;
        if (_allBooks.isNotEmpty) {}
        emit(BooksInitial());
      },
    );
  }

  void searchBooks(String query) {
    if (query.isEmpty) {
      emit(BooksSearchEmpty());
      return;
    }

    final lowerQuery = query.toLowerCase();

    final results = _allBooks.where((book) {
      final title = book.volumeInfo.title ?? '';
      final titleLower = title.toLowerCase();
      return titleLower.contains(lowerQuery);
    }).toList();

    if (results.isEmpty) {
      emit(BooksSearchSuccess([]));
    } else {
      emit(BooksSearchSuccess(results));
    }
  }
}
