import 'package:evently/core/appImage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../items/loginIcon.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/theme_provider.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});
static const String routeName="ForgetPassword";
  @override
  Widget build(BuildContext context) {
    var themeProvuder = context.watch<ThemeProvider>();

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,

        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          //
          // AssetImage(ThemeMode.light==themeProvider.themeMode?Appimage.arrowBackIcon:Appimage.arrowBackIconDark))
          icon:Icon(Icons.arrow_back_ios_new,color: Theme.of(context).colorScheme.primary),

        ),
       // backgroundColor:Theme.of(context).colorScheme.onSecondary ,
        title: Text(AppLocalizations.of(context)!.forgetPassword,style:Theme.of(context).textTheme.headlineSmall,),

      ),
      body: Column(
        children: [
          Image.asset(themeProvuder.themeMode==ThemeMode.light?Appimage.changeSetting:Appimage.changeSettingDark),
          SizedBox(
            height: 40,
          ),
          Loginicon(
            text: AppLocalizations.of(context)!.resetPassword,
          ),
        ],
      ),
    ));
  }
}
