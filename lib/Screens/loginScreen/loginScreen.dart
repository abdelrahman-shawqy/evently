import 'package:evently/core/appImage.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
 static const String routName="LoginScreen";
  @override
  Widget build(BuildContext context) {
    var themeProvuder = context.watch<ThemeProvider>();
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          title: Image.asset(ThemeMode.light==themeProvuder.themeMode?Appimage.eventlyLogo:Appimage.eventlyLogoDark),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.loginToYourAccount,style: Theme.of(context).textTheme.labelMedium,
              ),
              TextField(
                decoration: InputDecoration(
                  prefix: ImageIcon(AssetImage()),
                  hintText: AppLocalizations.of(context)!.enterYourEmail,
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  fillColor:Theme.of(context).colorScheme.surface ,
                  filled:true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
