import 'package:flutter/material.dart';

import '../../items/coustomTextField.dart';
import '../../items/itemsEvents/itemEvent.dart';

class FavoriteTab extends StatelessWidget {
  static const String routeName="FavoriteTab";
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(

          children: [
            Coustomtextfield(),
            Expanded(
              child: ListView.separated(
                separatorBuilder:(context,index)=>SizedBox(height:16 ,) ,
                itemCount:20 ,
                itemBuilder: (context,index)=>Itemevent(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
