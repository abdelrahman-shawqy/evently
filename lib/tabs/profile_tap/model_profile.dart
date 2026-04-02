import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../language/language_bottom_sheet.dart';

class Model_profile extends StatelessWidget {
  const Model_profile({
    super.key,
    required this.function,
    required this.label,
    required this.icon,
    required this.color
  });

  final void Function(BuildContext) function;

  final String label;
  final IconData icon;
  final Color color ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color:Theme.of(context).colorScheme.secondary, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: Theme.of(context).textTheme.bodyMedium),
              IconButton(
                onPressed: () {
                  //showLanguageBottomSheet(context);
                  function(context);
                },
                icon: Icon(icon, size: 28,color: color),
              ),
            ],
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
