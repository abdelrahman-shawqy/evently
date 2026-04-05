import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/language_app_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var LanguageProvider = context.watch<LanguageAppProvider>();

    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: Column(
          spacing: 3,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                context.read<LanguageAppProvider>().changeLanguage("en");
              },
              child: ("en" == LanguageProvider.languageApp)
                  ? getSelected(
                      context: context,
                      l: AppLocalizations.of(context)!.english,
                    )
                  : getUnSelected(l:AppLocalizations.of(context)!.english ,context: context),
            ),
            TextButton(

              onPressed: () {
                context.read<LanguageAppProvider>().changeLanguage("ar");
              },
              child: ("ar" == LanguageProvider.languageApp)
                  ? getSelected(
                context: context,
                l: AppLocalizations.of(context)!.arabic,
              )
                  : getUnSelected(l:AppLocalizations.of(context)!.arabic,context: context),
            ),
          ],
        ),
      ),
    );
  }

  getSelected({required String l, required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(l, style: Theme.of(context).textTheme.bodyMedium),
        Icon(
          Icons.check,
          size: 28,
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }

  getUnSelected({required String l, required BuildContext context}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l,
          style: Theme.of(context).textTheme.bodyMedium,
        // textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
