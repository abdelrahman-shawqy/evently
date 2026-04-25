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
      displayLarge: Apptextstyle.m2020,
      displaySmall: Apptextstyle.sBOld1414,
      headlineLarge: Apptextstyle.sBold1616,
      headlineMedium: Apptextstyle.m1414,
      headlineSmall: Apptextstyle.m1818,
      labelLarge: Apptextstyle.r1414add,
      labelMedium: Apptextstyle.sBold2424,
      labelSmall: Apptextstyle.sBold1414,
      titleLarge: Apptextstyle.m1818LoginDark,





      displayMedium: Apptextstyle.m1616White,

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
      displayLarge: Apptextstyle.m2020,
      displaySmall: Apptextstyle.sBOld1414Dark,
      headlineLarge: Apptextstyle.sBold1616Dark,
      headlineMedium: Apptextstyle.m1414Dark,
      headlineSmall: Apptextstyle.m1818Dark,
      labelLarge: Apptextstyle.r1414addDark,
      labelMedium: Apptextstyle.sBold2424Dark,
      labelSmall: Apptextstyle.sBold1414Dark,
      titleLarge: Apptextstyle.m1818LoginDark,






      displayMedium: Apptextstyle.m1616White,
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
