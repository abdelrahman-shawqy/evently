import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Firebase/fireBase_functions.dart';
import '../../core/appImage.dart';
import '../../providers/providerHomeChips.dart';

class Itemevent extends StatelessWidget {
  Itemevent({
    super.key,
    this.date,
    required this.descrebtion,
    required this.category,
  });

  final String descrebtion;

  final DateTime? date;

  final String category;

  //final int index;
  //final VoidCallback isFavorite;
  //final bool? isFavoriteFlag;

  DateFormat formatter = DateFormat("mmm dd");

  @override
  Widget build(BuildContext context) {
    var themeProvider = context.watch<ThemeProvider>();
    return ChangeNotifierProvider(
      create: (context) => Providerhomechips(),
      builder: (context, child) {
        var providerWatch = context.watch<Providerhomechips>();
        return Container(
          height: 193,
          width: double.infinity,
          decoration: BoxDecoration(
            //color: Colors.red,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(16),

                  child: Image.asset(
                    fit: BoxFit.fill,
                    // width: double.infinity,
                    ThemeMode.light == themeProvider.themeMode
                        ? "assets/images/$category.png"
                        : "assets/images/${category}Dark.png",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 66,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSecondary,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 1,
                            color: Theme.of(context).colorScheme.onError,
                          ),
                        ),
                        child: Text(
                          date.toString(),
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      Container(
                        width: 327,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSecondary,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 1,
                            color: Theme.of(context).colorScheme.onError,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                descrebtion,
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineMedium,
                              ),
                              InkWell(
                                onTap: () {
                                  providerWatch.changeFavoriteIcon();
                                },
                                child:providerWatch.isSelectedFavorite?Image.asset(
                              Appimage.favoriteIconTab,
                              height: 17.8,
                              width: 20,

                                ):Image.asset(
                                'assets/images/selectedHeart.png',
                                height: 17.8,
                                width: 20,

                              )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
