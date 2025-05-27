import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nba_sdk/feat/activity/utils/tabs_enum.dart';

import 'tab_buttons.dart';

class NbaTabbedButtons extends StatelessWidget {
  const NbaTabbedButtons({
    super.key,
    required this.overDueTitle,
    required this.dueTodayTitle,
    required this.upcomingDueTitle,
    required this.onOverDueTap,
    required this.onDueTodayTap,
    required this.onUpcomingDueTap,
    required this.selectedTab,
  });

  final String overDueTitle;
  final String dueTodayTitle;
  final String upcomingDueTitle;
  final Function() onOverDueTap;
  final Function() onDueTodayTap;
  final Function() onUpcomingDueTap;
  final ActivityTabs selectedTab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            TabButtons(title: overDueTitle, onTap: onOverDueTap, isSelected: selectedTab == ActivityTabs.overdue),
            Gap(10),
            TabButtons(title: dueTodayTitle, onTap: onDueTodayTap, isSelected: selectedTab == ActivityTabs.dueToday),
            Gap(10),
            TabButtons(title: upcomingDueTitle, onTap: onUpcomingDueTap, isSelected: selectedTab == ActivityTabs.upcomingDue),
          ],
        ),
      ),
    );
  }
}