import 'package:flutter/material.dart';

enum ActivityTabs {
  overdue('Overdue'),
  dueToday('Due Today'),
  upcomingDue('Upcoming Due'),
  all('All');

  final String value;
  const ActivityTabs(this.value);

  
}

extension ActivityTabsExtension on ActivityTabs {
  bool get isOverdue => this == ActivityTabs.overdue;
  bool get isDueToday => this == ActivityTabs.dueToday;
  bool get isUpcomingDue => this == ActivityTabs.upcomingDue;
  bool get isAll => this == ActivityTabs.all;
}

class NbaTab {
  final ActivityTabs tab;
  final Widget widget;

  const NbaTab({required this.tab, required this.widget});
}
