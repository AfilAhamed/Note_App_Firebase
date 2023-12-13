import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  //backgroundColor
  Color bgColor = const Color(0xFFe2e2fe);
  Color mainColor = const Color(0xFF000633);
  Color accentColor = const Color(0xFF0065FF);

  //cardsColor
  final List<Color> cardsColor = [
    Colors.blue.shade100,
    const Color.fromARGB(255, 137, 243, 190),
    Colors.pink.shade100,
    Colors.yellow.shade100,
    Colors.blueGrey.shade100,
    const Color.fromARGB(255, 91, 144, 251),
    const Color.fromARGB(255, 150, 105, 185),
    const Color.fromARGB(255, 254, 199, 116),
  ];

  //textStyle
  TextStyle cardTitle =
      GoogleFonts.roboto(fontSize: 19, fontWeight: FontWeight.bold);

  TextStyle cardDescription =
      GoogleFonts.nunito(fontSize: 17, fontWeight: FontWeight.normal);

  TextStyle cardDate =
      GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500);
}
