import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imgUrl, this.function});

  final String imgUrl;
  final GestureTapCallback? function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 2.7 / 4,
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: imgUrl,
            errorWidget: (context, url, error) => CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

Widget customListViweItem({
  @required onTap,
  @required imgUrl,
  required double radius,
}) =>
    GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: Container(
          height: 500,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: Colors.orange,
            image: DecorationImage(
              image: NetworkImage(
                imgUrl,
              ),
            ),
          ),
        ),
      ),
    );
