import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../language/language_bottom_sheet.dart';
import 'model_profile.dart';

class ProfileTap extends StatelessWidget {
  const ProfileTap({super.key});

  static const String routName = "ProfileTap";

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffF4F7FF),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(top: height*0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage("assets/images/rout_logo.png"),
              ),
              Padding(
                padding:  EdgeInsets.only(top: height*0.02,bottom: height*0.006),
                child: Text("Abdelrahman Ayman",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
              ),
              Text("abdelrahmanayman.route@gmail.com",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Color(0xff686868)),),
              Padding(
                padding:  EdgeInsets.only(top: height*0.05),
                child: Column(
                  spacing: 16,
                  children: [
                    Model_profile(
                      icon: Icons.arrow_forward_ios_sharp,
                      function:themeshow ,
                      label: AppLocalizations.of(context)!.theme,
                    ),
                    Model_profile(
                      icon: Icons.arrow_forward_ios_sharp,
                      function: showLanguageBottomSheet,
                      label: AppLocalizations.of(context)!.language,
                    ),
                    Model_profile(
                      icon: Icons.arrow_forward_ios_sharp,
                      function: showLanguageBottomSheet,
                      label: AppLocalizations.of(context)!.language,
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
void themeshow(BuildContext){}
  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }
}


