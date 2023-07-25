import 'package:cocktail_project/constants/constant_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  String cockName;
  String cockImage;
  ListWidget({required this.cockName, required this.cockImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 220,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(cockImage),
            ),
          ),
        ),
        Positioned.fill(
          child: Opacity(
            opacity: 0.3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xFF000000),
              ),
            ),
          ),
        ),
        Center(
          child: Text(
            cockName,
            style: ConstantText.titleTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
