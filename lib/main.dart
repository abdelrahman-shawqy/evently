import 'package:evently/core/my_theme.dart';
import 'package:evently/providers/language_app_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/tabs/home_tab.dart';
import 'package:evently/tabs/profile_tap/profile_tap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp( MultiProvider(
    providers:[
      ChangeNotifierProvider(
      create:(context)=>ThemeProvider() ),

      ChangeNotifierProvider(
          create:(context)=>LanguageAppProvider() ),
    ],
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var LanguageProvider = Provider.of<LanguageAppProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(LanguageProvider.languageApp),
      theme:MyThemeData.lightTheme ,
      darkTheme:MyThemeData.darkTheme ,
      themeMode: themeProvider.themeMode,
      initialRoute: ProfileTap.routName,
      routes: {
        Homescreen.routName:(context)=>Homescreen(),
        ProfileTap.routName:(context)=>ProfileTap(),

      },
    );
  }
}




