import 'package:bloc/bloc.dart';
import 'package:book_app/Features/home/data/models/book_model/book_model.dart';
import 'package:book_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
part 'similler_books_state.dart';

class SimillerBooksCubit extends Cubit<SimillerBooksState> {
  SimillerBooksCubit(this.homeRepo) : super(SimillerBooksInitial());

  final HomeRepo homeRepo;

  Future<void> feachSimillerBooks({required String category}) async {
    emit(SimillerBooksLoading());
    var result = await homeRepo.featchFSimillerBooks(category: category);
    result.fold((failure) {
      emit(SimillerBooksFailuer(failure.errMessage));
    }, (books) {
      emit(SimillerBooksSuccess(books));
    });
  }
}
