import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyConstant {
  // Field
  static Color primary = Color.fromARGB(255, 182, 138, 57);
  static Color dark = Color.fromRGBO(0, 0, 0, 1);
  static Color active = Color.fromARGB(255, 131, 89, 11);

  // Method
  BoxDecoration bgBox() {
    return BoxDecoration(
      gradient: RadialGradient(
        radius: 2.0,
        center: const Alignment(-0.3, -0.3),
        colors: [const Color.fromARGB(255, 255, 255, 255), primary],
      ),
    );
  }

  TextStyle h1Style() {
    return GoogleFonts.kanit(
        textStyle: TextStyle(
      fontSize: 36,
      color: dark,
      fontWeight: FontWeight.bold,
    ));
  }

  TextStyle h2Style() {
    return GoogleFonts.kanit(
        textStyle: TextStyle(
      fontSize: 16,
      color: dark,
      fontWeight: FontWeight.w700,
    ));
  }

  TextStyle h3Style() {
    return GoogleFonts.kanit(
        textStyle: TextStyle(
      fontSize: 14,
      color: dark,
      fontWeight: FontWeight.normal,
    ));
  }

  TextStyle h3ActiveStyle() {
    return GoogleFonts.kanit(
        textStyle: TextStyle(
      fontSize: 14,
      color: active,
      fontWeight: FontWeight.normal,
    ));
  }
}
