import 'package:bloc/bloc.dart';
import 'package:book_app/Features/home/data/models/book_model/book_model.dart';
import 'package:book_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
part 'feature_books_state.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit(this.homeRepo) : super(FeatureBooksInitial());

  final HomeRepo homeRepo;

  Future<void> feachFeatureBooks() async {
    emit(FeatureBooksLoading());

    var result = await homeRepo.featchFeaturedBooks();
    result.fold((failure) {
      emit(FeatureBooksFailuer(failure.errMessage));
    }, (books) {
      emit(FeatureBooksSuccess(books));
    });
  }
}
