import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import '../../../../core/utils/assets.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imgUrl});

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imgUrl,
          errorWidget: (context, url, error) => CircularProgressIndicator(),
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
