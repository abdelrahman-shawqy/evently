import 'package:evently/tabs/home_tab.dart';
import 'package:evently/tabs/profile_tap/profile_tap.dart';
import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale("en"),
      //theme:ThemeData() ,
      //darkTheme: ,
      //themeMode: ThemeMode.light,
      initialRoute: ProfileTap.routName,
      routes: {
        Homescreen.routName:(context)=>Homescreen(),
        ProfileTap.routName:(context)=>ProfileTap(),

      },
    );
  }
}




