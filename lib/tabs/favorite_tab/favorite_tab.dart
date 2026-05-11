import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../items/costomTextField/coustomTextField.dart';
import '../../items/itemsEvents/itemEvent.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/providerHomeChips.dart';

class FavoriteTab extends StatelessWidget {
  static const String routeName="FavoriteTab";
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Providerhomechips(),
      builder: (context, child) {
        var providerChip = context.watch<Providerhomechips>();
        var providerWatch = context.watch<Providerhomechips>();
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Coustomtextfield(
                    hasLable: false,
                    maxLines: 1,
                    hintText: AppLocalizations.of(context)!.searchForEvent,
                  ),
                  Expanded(
                    child:
                    providerChip.isLoading?
                    Center(child: CircularProgressIndicator()):
                    providerChip.errorMassege.isNotEmpty?Center(
                      child: Text(providerWatch.errorMassege),
                    ) :providerWatch.tasks.isEmpty?Center(child:
                    Text("No Favorite Tasks"),):
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16),
                        itemCount: providerWatch.tasks.length,
                        itemBuilder: (context, index) => Itemevent(
                          category: providerWatch.tasks[index].category,
                          date: (providerWatch.tasks[index].date),
                          descrebtion:providerWatch.tasks[index].description,

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
