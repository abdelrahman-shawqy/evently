import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';

class Model_profile extends StatelessWidget {
   Model_profile({
    super.key,
    required this.function,
    required this.label,
    required this.icon,
    required this.color,
    required this.isIcon,

  });

  final void Function(BuildContext) function;

  final String label;
  final IconData icon;
  final Color color ;
  final bool isIcon;

  @override
  Widget build(BuildContext context) {
    var themeProvider=context.watch<ThemeProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color:Theme.of(context).colorScheme.onError, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: Theme.of(context).textTheme.bodyMedium),

              isIcon==true?IconButton(
                onPressed: () {
                  //showLanguageBottomSheet(context);
                  function(context);
                },
                icon: Icon(icon, size: 28,color: color),
              ):Switch(
                activeColor: Theme.of(context).colorScheme.primary,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey.shade400,
                value:themeProvider.isDarkMode ,
                onChanged: (value) {
                  context.read<ThemeProvider>().changeTheme(value);
                }
                  ),
            ]
          ),
        ),
      ),
    );
  }
}


/*void showLanguageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) => LanguageBottomSheet(),
  );
}*/
