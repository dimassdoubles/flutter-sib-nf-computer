import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// color
Color navy = const Color.fromARGB(255, 14, 30, 82);
Color gray = const Color.fromARGB(255, 217, 223, 247);
Color blue = const Color.fromARGB(255, 13, 107, 250);
Color purple = const Color.fromARGB(255, 198, 46, 247);
Color darkGray = const Color.fromARGB(255, 115, 116, 125);

// fonts
TextStyle textStyle1 = GoogleFonts.openSans();
TextStyle textStyle2 = GoogleFonts.sourceSans3();

ThemeData themeData = ThemeData(
  backgroundColor: navy,
  scaffoldBackgroundColor: Colors.white,

  brightness: Brightness.light,


  // floating
  floatingActionButtonTheme: floatingActionButtonThemeData,

  // appbar
  appBarTheme: appBarTheme,

  //
);

AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: Colors.white,
  foregroundColor: darkGray,
  elevation: 0,
);

FloatingActionButtonThemeData floatingActionButtonThemeData =
    FloatingActionButtonThemeData(
  backgroundColor: blue,
  foregroundColor: Colors.white,
);
