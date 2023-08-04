// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageAndTitleWidget extends StatelessWidget {
  String title;
  String imageUrl;
  TextStyle style;
  ImageAndTitleWidget({
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
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.fill,
              maxHeightDiskCache: 400,
              maxWidthDiskCache: 400,
              placeholder: (context, url) => Container(
                width: 250,
                height: 250,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: style,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
