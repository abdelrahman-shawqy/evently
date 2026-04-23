import 'package:flutter/material.dart';

class Chipshometab extends StatelessWidget {
  Chipshometab({
    super.key,
    required this.chips,
    required this.onSelected,
    required this.selectedIndex,
  });

  final List<String> chips;
  final int selectedIndex;
  final Function(int) onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        itemBuilder: (context, index) => ChoiceChip(
          onSelected: (__) => onSelected(index),
          selected: selectedIndex == index,
          side: BorderSide(
            color: Theme.of(context).colorScheme.onError,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
          selectedColor: Theme.of(context).colorScheme.primary,
          label: Text(
            "${chips[index]}",
            style: selectedIndex == index
                ? Theme.of(context).textTheme.displayMedium
                : Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        itemCount: chips.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 8),
      ),
    );
  }
}
