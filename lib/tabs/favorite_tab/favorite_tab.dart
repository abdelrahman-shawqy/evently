import 'package:flutter/material.dart';

class FavoriteTab extends StatelessWidget {
  static const String routeName="FavoriteTab";
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 200,
        width: 100,
        color: Colors.amber,
      ),
    );
  }
}
