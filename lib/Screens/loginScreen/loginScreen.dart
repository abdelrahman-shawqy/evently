import 'package:evently/Screens/homeScreen/home_Screen.dart';
import 'package:evently/Screens/loginScreen/registerScreen.dart';
import 'package:evently/core/appImage.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Firebase/fireBase_functions.dart';
import '../../items/costomTextField/textFieldLogin.dart';
import '../../items/loginIcon.dart';
import '../../l10n/app_localizations.dart';
import 'Forget_Password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routName = "LoginScreen";

  @override
  Widget build(BuildContext context) {
    var themeProvuder = context.watch<ThemeProvider>();
    var emailControler = TextEditingController();
    var passwordControler = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          title: Image.asset(
            ThemeMode.light == themeProvuder.themeMode
                ? Appimage.eventlyLogo
                : Appimage.eventlyLogoDark,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.loginToYourAccount,
                  style: Theme.of(context).textTheme.labelMedium,
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 47, top: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Textfieldlogin(
                        obscureText:false,
                        validator: (value){
                          if(value==null||value.isEmpty){
                            return "Please Enter Your Email";
                          }
                          if(!FirebaseFunctions.isValidEmail(value)){
                            return "Please Enter Valid Email";
                          }
                          return null ;
                        },
                        hintText: AppLocalizations.of(context)!.enterYourEmail,
                        prefixIcon: Appimage.sms,
                        controller: emailControler,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 8),
                        child: Textfieldlogin(
                          obscureText:true,
                          validator: (value){
                            if(value==null||value.isEmpty){
                              return "Please Enter Your PassWord";
                            }
                            if(value.length<6){
                              return "tha password must be at least 6 charactares ";
                            }

                            return null ;
                          },
                          hintText: AppLocalizations.of(
                            context,
                          )!.enterYourPassword,

                          prefixIcon: Appimage.lock,
                          suffixIcon: Appimage.eye_slash,
                          controller: passwordControler,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ForgetPassword.routeName);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.forgetPassword,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    if(formKey.currentState!.validate()){
                      String? error = await FirebaseFunctions.signIn(
                        emailControler.text,
                        passwordControler.text,
                      );
                      if (error == null) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          HomeScreen.routName,
                              (route) => false,
                        );
                      } else {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(error)));
                        print(error);
                      }
                    }

                  },
                  child: Loginicon(text: AppLocalizations.of(context)!.login),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 84, bottom: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.dontHaveAnAccount,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterScreen.routeName);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.signup,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).colorScheme.onError,

                        thickness: 2, // سمك الخط
                        height: 20, // المسافة حواليه
                        // indent: 20,             // بداية من الشمال
                        endIndent: 16, // نهاية من اليمين
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.or,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).colorScheme.onError, // اللون
                        thickness: 2, // سمك الخط
                        height: 20, // المسافة حواليه
                        indent: 16, // بداية من الشمال
                        // endIndent: 20,          // نهاية من اليمين
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24),
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onError,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Appimage.google, height: 24, width: 24),
                      SizedBox(width: 16),
                      Text(
                        AppLocalizations.of(context)!.loginWithgoogle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
