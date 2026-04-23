import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../tabs/homeTap/homeTab.dart';
import '../add_event_screen/addEventScreen.dart';
import '../../core/appImage.dart';
import '../../providers/home_provider.dart';
import '../../tabs/favorite_tab/favorite_tab.dart';
import '../../tabs/profile_tap/profile_tap.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  static const String routName = 'Homescreen';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder:(context, child) {
        var homeprovider = context.watch<HomeProvider>();
        return Scaffold(

          body: tabs[homeprovider.selectedIndex],
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddEventScreen.routName);
            },
            child: Icon(Icons.add, color: Colors.white),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value){
              homeprovider.changeIndex(value);
            },
            currentIndex: homeprovider.selectedIndex,
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(Appimage.homeIconTab)),
                label: AppLocalizations.of(context)!.home,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(Appimage.favoriteIconTab)),
                label: AppLocalizations.of(context)!.favorite,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(Appimage.profileIconTab)),
                label: AppLocalizations.of(context)!.profile,
              ),
            ],
          ),
        );
      },

    );

  }
  List <Widget>tabs=[Hometab(),FavoriteTab(),ProfileTap()];
}
