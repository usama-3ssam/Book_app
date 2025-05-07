part of 'similler_books_cubit.dart';

sealed class SimillerBooksState extends Equatable {
  const SimillerBooksState();

  @override
  List<Object> get props => [];
}

final class SimillerBooksInitial extends SimillerBooksState {}

final class SimillerBooksLoading extends SimillerBooksState {}

final class SimillerBooksSuccess extends SimillerBooksState {
  final List<BookModel> books;

  const SimillerBooksSuccess(this.books);
}

final class SimillerBooksFailuer extends SimillerBooksState {
  final String message;

  const SimillerBooksFailuer(this.message);
}
