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
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle:Apptextstyle.r1212Selected ,
      unselectedLabelStyle:Apptextstyle.r1212UnSelected ,
      //selectedItemColor:AppColor.MainColor,
      //unselectedItemColor: AppColor.disable,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.MainColor,
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(50)),
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

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle:Apptextstyle.r1212SelectedDark ,
      unselectedLabelStyle:Apptextstyle.r1212UnSelectedDark ,
      selectedItemColor:AppColor.MainColorDark,
      unselectedItemColor: AppColor.disableDark,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.MainColorDark,
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(50)),
    ),

  );
}
