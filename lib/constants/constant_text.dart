import 'package:cocktail_project/constants/constant_colors.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

class ConstantText {
  static TextStyle titleTextStyle = GoogleFonts.openSans(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w900,
      decoration: TextDecoration.none);
  static TextStyle tagText = GoogleFonts.openSans(
      fontSize: 16,
      color: Colors.white70,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);
  static TextStyle ingText = GoogleFonts.openSans(
      fontSize: 16,
      color: Colors.white70,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);
  static TextStyle bigGradientText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w900,
    foreground: Paint()
      ..shader = const LinearGradient(
        colors: <Color>[Colors.blue, Colors.purple],
      ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
  );
  static TextStyle smallGradientText = GoogleFonts.openSans(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    foreground: Paint()
      ..shader = const LinearGradient(
        colors: <Color>[
          Colors.black,
          Colors.deepPurpleAccent,
          Colors.red,
          Colors.lightBlue
        ],
      ).createShader(Rect.fromLTWH(10.0, 40.0, 200.0, 70.0)),
  );
  static TextStyle bigWhiteText = GoogleFonts.openSans(
      fontSize: 24, fontWeight: FontWeight.w900, color: Colors.white);
  static TextStyle smallRandomGradientText = GoogleFonts.openSans(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    foreground: Paint()
      ..shader = const LinearGradient(
        colors: <Color>[
          Colors.deepPurpleAccent,
          Colors.red,
          Colors.lightBlue,
          Colors.orangeAccent,
          Colors.green,
          Colors.yellow,
        ],
      ).createShader(Rect.fromLTWH(
          Random().nextDouble() * 120,
          Random().nextDouble() * 120,
          Random().nextDouble() * 120,
          Random().nextDouble() * 120)),
  );
}
