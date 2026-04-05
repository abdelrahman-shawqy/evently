import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'appColors.dart';
import 'appTextStyle.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(centerTitle: true,),
    textTheme: TextTheme(
      bodyLarge: Apptextstyle.sBOld2020,
      bodyMedium:Apptextstyle.m1616,
      bodySmall: Apptextstyle.r1414,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColor.MainColor,
      onPrimary: AppColor.disable,
      secondary: AppColor.sectext,
      onSecondary: AppColor.background,
      error: AppColor.red,
      onError:AppColor.stroke,
      surface: AppColor.inputs,


      onSurface: Colors.black,




    ),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(centerTitle: true,),

    textTheme: TextTheme(
      bodyLarge: Apptextstyle.sBOld2020Dark,
      bodyMedium:Apptextstyle.m1616Dark,
      bodySmall: Apptextstyle.r1414Dark,
    ),

    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColor.MainColorDark,
      onPrimary: AppColor.disableDark,
      secondary: AppColor.sectextDark,
      onSecondary: AppColor.backgroundDark,
      error: AppColor.redDark,
      onError:AppColor.strokeDark,
      surface: AppColor.inputsDark,


      onSurface: Colors.black,
    ),
  );
}
