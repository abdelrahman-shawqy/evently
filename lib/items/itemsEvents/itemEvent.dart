import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/appImage.dart';

class Itemevent extends StatelessWidget {
  const Itemevent({super.key});
  @override
  Widget build(BuildContext context) {
    var themeProvider =context.watch<ThemeProvider>();

    return  Container(
      height: 193,
      width: 343,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Expanded(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Image.asset(
                fit: BoxFit.fill,
                  ThemeMode.light==themeProvider.themeMode?Appimage.sport:Appimage.sportDark),
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
                      border: Border.all(width: 1,color: Theme.of(context).colorScheme.onError,)
                    ),
                    child: Text("21 jan",style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  Container(
                    width: 327,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 1,color: Theme.of(context).colorScheme.onError,)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("This is a Birthday Party ",style: Theme.of(context).textTheme.headlineMedium,),
                        Image.asset(Appimage.favoriteIconTab,height: 17.8,width: 20,)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}
