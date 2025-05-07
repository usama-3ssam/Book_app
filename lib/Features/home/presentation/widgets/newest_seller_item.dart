// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:book_app/Features/home/data/models/book_model/book_model.dart';
import 'package:book_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/styles.dart';
import 'custom_item_view.dart';
import 'rateing_book.dart';

class NewestBooksItem extends StatelessWidget {
  const NewestBooksItem(
      {super.key, @required this.function, required this.bookModel});

  final GestureTapCallback? function;
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(
              imgUrl: bookModel.volumeInfo.imageLinks.thumbnail,
            ),
            VerticalSpace(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      bookModel.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                    ),
                  ),
                  HorizontalSpace(hight: 3),
                  Text(
                    bookModel.volumeInfo.authors![0],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle14,
                  ),
                  HorizontalSpace(hight: 3),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      RateBook(
                        rating:
                            bookModel.volumeInfo.averageRating?.round() ?? 0,
                        count: bookModel.volumeInfo.ratingsCount ?? 0,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
