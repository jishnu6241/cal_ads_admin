import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_constant.dart';

ThemeData apptheme = ThemeData(
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: GoogleFonts.poppins(
        color: Colorconstant.primerycolor,
        fontSize: 16,
        fontWeight: FontWeight.normal),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    filled: true,
    fillColor: Colorconstant.tertiarycolor,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
  ),
);
