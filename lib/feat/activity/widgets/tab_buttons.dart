import 'package:flutter/material.dart';
import 'package:nba_sdk/feat/core/theme/nba_theme.dart';

class TabButtons extends StatelessWidget {
  const TabButtons({super.key, required this.title, required this.onTap, required this.isSelected});

  final String title;
  final Function() onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? NbaTheme.primaryDark : NbaTheme.grayFour,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: NbaTheme.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
