import 'package:flutter/material.dart';

import '../../items/costomTextField/coustomTextField.dart';
import '../../items/itemsEvents/itemEvent.dart';
import '../../l10n/app_localizations.dart';

class FavoriteTab extends StatelessWidget {
  static const String routeName="FavoriteTab";
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: ListView.separated(
                  separatorBuilder:(context,index)=>SizedBox(height:16 ,) ,
                  itemCount:20 ,
                  itemBuilder: (context,index)=>Itemevent(
                    //date: "",
                    category: "",
                    descrebtion:"" ,

                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
