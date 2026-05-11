import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/my_theme.dart';
import 'package:evently/providers/language_app_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/tabs/favorite_tab/favorite_tab.dart';
import 'package:evently/Screens/homeScreen/home_Screen.dart';
import 'package:evently/tabs/homeTap/homeTab.dart';
import 'package:evently/tabs/profile_tap/profile_tap.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/add_event_screen/addEventScreen.dart';
import 'Screens/loginScreen/Forget_Password.dart';
import 'Screens/loginScreen/loginScreen.dart';
import 'Screens/loginScreen/registerScreen.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';
import 'whatsApp/whatsApp.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();

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
      initialRoute: LoginScreen.routName,
      routes: {
        WhatsAppChatScreen.routName:(context)=>WhatsAppChatScreen(),
        HomeScreen.routName:(context)=>HomeScreen(),
        ProfileTap.routName:(context)=>ProfileTap(),
        FavoriteTab.routeName:(context)=>FavoriteTab(),
        Hometab.routeName:(context)=>Hometab(),
        AddEventScreen.routName:(context)=>AddEventScreen(),
        LoginScreen.routName:(context)=>LoginScreen(),
        RegisterScreen.routeName:(context)=>RegisterScreen(),
        ForgetPassword.routeName:(context)=>ForgetPassword(),
      },
    );
  }
}




