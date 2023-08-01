import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/constant_text.dart';

class ImageAndTitleWidget extends StatelessWidget {
  String title;
  String imageUrl;
  TextStyle style;
  ImageAndTitleWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: ClipRRect(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              maxHeightDiskCache: 400,
              maxWidthDiskCache: 400,
              placeholder: (context, url) => Container(
                width: 250,
                height: 250,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: style,
        )
      ],
    );
  }
}
