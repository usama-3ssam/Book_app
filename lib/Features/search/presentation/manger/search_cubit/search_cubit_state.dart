part of 'search_cubit_cubit.dart';

sealed class SearchCubitState extends Equatable {
  const SearchCubitState();

  @override
  List<Object> get props => [];
}

final class SearchCubitInitial extends SearchCubitState {}

class BooksInitial extends SearchCubitState {}

class BooksLoading extends SearchCubitState {}

class BooksSuccess extends SearchCubitState {
  final List<BookModel> books;
  const BooksSuccess(this.books);
}

class BooksSearchSuccess extends SearchCubitState {
  final List<BookModel> books;
  const BooksSearchSuccess(this.books);

  @override
  List<Object> get props => [books];
}

class BooksSearchEmpty extends SearchCubitState {}

class BooksFailure extends SearchCubitState {
  final String message;
  const BooksFailure(this.message);
}
