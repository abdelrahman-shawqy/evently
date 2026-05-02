import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Firebase/fireBase_functions.dart';
import '../../core/appImage.dart';
import '../../items/costomTextField/textFieldLogin.dart';
import '../../items/loginIcon.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/theme_provider.dart';
import 'loginScreen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const String routeName="RegisterScreen";

  @override
  Widget build(BuildContext context) {
    var themeProvuder = context.watch<ThemeProvider>();
    var emailControler = TextEditingController();
    var passwordControler = TextEditingController();
    var nameControler = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          automaticallyImplyLeading: false,
          title: Image.asset(ThemeMode.light==themeProvuder.themeMode?Appimage.eventlyLogo:Appimage.eventlyLogoDark),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.createYourAccount,style: Theme.of(context).textTheme.labelMedium,
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 47,top: 24),
                child: Column(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Textfieldlogin(
                      hintText: AppLocalizations.of(context)!.enterYourName,
                      prefixIcon: Appimage.profileIconTab,
                      controller: nameControler,
                    ),

                    Textfieldlogin(
                      hintText: AppLocalizations.of(context)!.enterYourEmail,
                      prefixIcon: Appimage.sms,
                      controller: emailControler,
                    ),
                    Textfieldlogin(
                      hintText: AppLocalizations.of(context)!.enterYourPassword,
                      prefixIcon: Appimage.lock,
                      suffixIcon: Appimage.eye_slash,
                      controller: passwordControler,
                    ),
                    Textfieldlogin(
                      hintText: AppLocalizations.of(context)!.confirmYourPassword,
                      prefixIcon: Appimage.lock,
                      suffixIcon: Appimage.eye_slash,
                      //controller: passwordControler,
                    ),

                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  FirebaseFunctions.creatNewUser(
                    email: emailControler.text,
                    password:passwordControler.text ,
                    name:nameControler.text ,

                   onSuccess:(){
                     Navigator.pop(context);
                   } ,
                    onError: (message){
                      if (!FirebaseFunctions.isValidEmail(emailControler.text)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Invalid email format\n Please enter a valid email")),
                        );
                        return;
                      }
                     ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(content: Text(message)));
                    },


                  );
                },
                child: Loginicon(
                  text: AppLocalizations.of(context)!.signup,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 84,bottom: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.alreadyHaveAnAccount,style: Theme.of(context).textTheme.bodySmall,),
        TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text(AppLocalizations.of(context)!.login,style: Theme.of(context).textTheme.labelSmall,),
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

                      thickness: 2,           // سمك الخط
                      height: 20,             // المسافة حواليه
                      // indent: 20,             // بداية من الشمال
                      endIndent: 16,          // نهاية من اليمين
                    ),
                  ),
                  Text(AppLocalizations.of(context)!.or,style:TextStyle(color: Theme.of(context).colorScheme.primary),),
                  Expanded(
                    child: Divider(

                      color: Theme.of(context).colorScheme.onError,     // اللون
                      thickness: 2,           // سمك الخط
                      height: 20,             // المسافة حواليه
                      indent: 16,             // بداية من الشمال
                      // endIndent: 20,          // نهاية من اليمين
                    ),
                  ),

                ],
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color:Theme.of(context).colorScheme.onError, width: 1),
                ),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Appimage.google,height: 24,width: 24,),
                    SizedBox(
                      width: 16,
                    ),
                    Text(AppLocalizations.of(context)!.signUpWithGoogle,style:Theme.of(context).textTheme.titleLarge),
                  ],
                ),
              )




            ],
          ),
        ),
      ),
    );
  }
}
