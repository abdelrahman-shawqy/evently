import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Firebase/fireBase_functions.dart';
import '../../core/appImage.dart';
import '../../items/itemsEvents/itemEvent.dart';
import '../../providers/language_app_provider.dart';
import '../../providers/providerHomeChips.dart';
import '../../providers/theme_provider.dart';
import 'chipsHomeTab.dart';

class Hometab extends StatelessWidget {
  static const String routeName = "Hometab";

  Hometab({super.key});

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = context.watch<ThemeProvider>();
    var languageProviderProvider = context.watch<LanguageAppProvider>();
    return ChangeNotifierProvider(
      create: (context) => Providerhomechips()..getStreamTaskes(),
      builder: (context, child) {
        var providerChip = context.watch<Providerhomechips>();
        var providerWatch = context.watch<Providerhomechips>();
        providerChip.category=chips;
        chips = [
          AppLocalizations.of(context)!.all,
          AppLocalizations.of(context)!.birthday,
          AppLocalizations.of(context)!.bookClub,
          AppLocalizations.of(context)!.exhibition,
          AppLocalizations.of(context)!.meeting,
          AppLocalizations.of(context)!.sport,
        ];

        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(AppLocalizations.of(context)!.welcome),
                          Text(
                            "Abdelrahman Ayman",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (ThemeMode.light == themeProvider.themeMode) {
                                themeProvider.changeThemeHome(ThemeMode.dark);
                              } else {
                                themeProvider.changeThemeHome(ThemeMode.light);
                              }
                            },
                            child: Image.asset(
                              ThemeMode.light != themeProvider.themeMode
                                  ? Appimage.moon
                                  : Appimage.sun,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              languageProviderProvider.languageApp == "en"
                                  ? languageProviderProvider.changeLanguage(
                                      "ar",
                                    )
                                  : languageProviderProvider.changeLanguage(
                                      "en",
                                    );
                            },
                            child: Container(
                              height: 32,
                              width: 34,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context)!.enIconHomeTab,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.displaySmall,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Chipshometab(
                      onSelected: (index) {
                        providerChip.changeSelectedIndex(index);
                      },
                      chips: chips,
                      selectedIndex: providerChip.selectedIndex,
                    ),
                  ),

                  Expanded(
                    child:
                    providerChip.isLoading?
                    Center(child: CircularProgressIndicator()):
                    providerChip.errorMassege.isNotEmpty?Center(
                      child: Text(providerWatch.errorMassege),
                    ) :providerWatch.tasks.isEmpty?Center(child: 
                      Text("No Tasks"),):
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

  List<String> chips = [];
}
