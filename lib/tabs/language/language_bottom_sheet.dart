import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatelessWidget {
   LanguageBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    var hight =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
      body:Column(
        spacing: 3,
        children: [
          TextButton(onPressed: (){}, child: Text(AppLocalizations.of(context)!.english)),
          TextButton(onPressed: (){}, child: Text(AppLocalizations.of(context)!.arabic))
        ],
      )
    );
  }
}
