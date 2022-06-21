import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyConstant {
  // Field
  static Color primary = const Color.fromARGB(255, 138, 206, 29);
  static Color dark = const Color.fromARGB(255, 0, 0, 0);
  static Color active = const Color.fromARGB(255, 250, 225, 1);

  // Method
  BoxDecoration bgBox() {
    return BoxDecoration(
      gradient: RadialGradient(
        radius: 2.0,
        center: Alignment(-0.3, -0.3),
        colors: [Colors.white, primary],
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
    return TextStyle(
      fontSize: 16,
      color: dark,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle h3Style() {
    return TextStyle(
      fontSize: 14,
      color: dark,
      fontWeight: FontWeight.normal,
    );
  }
}
