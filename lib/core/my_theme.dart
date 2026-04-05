import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(centerTitle: true,),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,fontSize: 20,
        color: Color(0xff1C1C1C),
      ),
      bodySmall: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: 16,color: Color(0xff686868),
      ),
      bodyMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: 24,color: Color(0xff1C1C1C),
      ),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff0E3A99),
      onPrimary: Color(0xffB9B9B9),
      secondary: Color(0xffFFFFFF),
      onSecondary: Color(0xffF0F0F0),
      error: Color(0xffFF3232),
      onError: Color(0xff1C1C1C),
      surface: Color(0xffF4F7FF),
      onSurface: Color(0xffE9EAEB),
      outline: Color(0xff686868),



    ),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(centerTitle: true,),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,fontSize: 20,
        color: Color(0xffFFFFFF),
      ),
      bodySmall: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: 16,color: Color(0xffD6D6D6),
      ),
      bodyMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: 24,color: Color(0xffFFFFFF),
      ),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff457AED),
      onPrimary: Color(0xffB9B9B9),
      secondary: Color(0xff001440),
      onSecondary: Color(0xff002D8F),
      error: Color(0xffFF3232),
      onError: Color(0xffFFFFFF),
      surface: Color(0xff000F30),
      onSurface: Color(0xff457AED),
      outline: Color(0xff686868)
    ),
  );
}
