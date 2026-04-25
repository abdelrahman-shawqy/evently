import 'package:flutter/material.dart';

class Loginicon extends StatelessWidget {
  const Loginicon({super.key,required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(child: Text(text,style: Theme.of(context).textTheme.displayLarge,)),
    );
  }
}
