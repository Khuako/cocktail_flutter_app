import 'package:cocktail_project/constants/constant_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TagCardWidget extends StatelessWidget {
  String title;
  TagCardWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade600,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(child: Text(title, style: ConstantText.tagText)),
      ),
    );
  }
}
