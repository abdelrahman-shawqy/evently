import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/appImage.dart';

class Coustomtextfield extends StatelessWidget {
  Coustomtextfield ({super.key});

  @override
  Widget build(BuildContext context) {
    //var themeProvider=context.watch<ThemeProvider>()
    return  SafeArea(
      child: TextField(
        style: Theme.of(context).textTheme.headlineMedium,
      decoration: InputDecoration(

        hintText: AppLocalizations.of(context)!.searchForEvent,
        //errorText: AppLocalizations.of(context)!.notFound,
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
      hintStyle: Theme.of(context).textTheme.bodySmall,
       // prefixIcon: Icon(Icons.person),
        suffixIcon: ImageIcon(AssetImage(Appimage.searchNormal),color:Theme.of(context).colorScheme.primary,),
      enabledBorder: buildOutlineInputBorder(context),
        focusedBorder: buildOutlineInputBorder(context),
        errorBorder: buildOutlineInputBorder(context),
        focusedErrorBorder: buildOutlineInputBorder(context),
      ),
    ),);
  }
  OutlineInputBorder buildOutlineInputBorder(BuildContext context){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        width: 2,
        color: Theme.of(context).colorScheme.onError,
      ),

    );
  }
}
