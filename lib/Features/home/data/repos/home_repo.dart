import 'package:book_app/Features/home/data/models/book_model/book_model.dart';
import 'package:book_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> featchNewestBooks();
  Future<Either<Failure, List<BookModel>>> featchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> featchFSimillerBooks(
      {required String category});
}
