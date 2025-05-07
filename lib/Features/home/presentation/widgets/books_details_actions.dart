import 'package:book_app/Features/home/data/models/book_model/book_model.dart';
import 'package:book_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/styles.dart';
import 'buttoms_in_details_book.dart';
import 'custom_item_view.dart';
import 'rateing_book.dart';

class BooksDetailsActions extends StatelessWidget {
  const BooksDetailsActions({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .25),
          child: CustomBookImage(
            imgUrl: bookModel.volumeInfo.imageLinks.thumbnail,
          ),
        ),
        HorizontalSpace(hight: 43),
        Column(
          children: [
            SizedBox(
              child: Text(
                bookModel.volumeInfo.title!,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle20.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  fontFamily: kGtSectraFine,
                ),
              ),
            ),
            HorizontalSpace(hight: 6),
            Opacity(
              opacity: .7,
              child: Text(
                bookModel.volumeInfo.authors![0],
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle14.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            HorizontalSpace(hight: 18),
            RateBook(
              rating: bookModel.volumeInfo.averageRating?.round() ?? 0,
              count: bookModel.volumeInfo.ratingsCount ?? 0,
            ),
            HorizontalSpace(hight: 37),
            ButtomsInDetailsBook(),
          ],
        ),
      ],
    );
  }
}
