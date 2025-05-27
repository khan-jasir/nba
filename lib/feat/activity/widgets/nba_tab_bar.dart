import 'package:flutter/material.dart';
import 'package:nba_sdk/feat/activity/utils/tabs_enum.dart';
import 'package:nba_sdk/feat/core/theme/nba_theme.dart';


class NbaTabBar extends StatelessWidget {
  final TabController controller;
  final List<ActivityTabs> tabs;
  final List<int> tabCounts;

  const NbaTabBar({
    super.key,
    required this.controller,
    required this.tabs,
    required this.tabCounts,
  });

  List<Widget> _getTabs() {
    if (tabs.length != tabCounts.length) {
      return tabs.map((tab) => Tab(text: tab.value)).toList();
    }
    return List.generate(tabs.length, (index) {
      final tab = tabs[index];
      final count = tabCounts[index];
      return Tab(text: '${tab.value} ($count)');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: NbaTheme.sucessPrimaryDark,
      ),
      child: TabBar(
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        dividerColor: NbaTheme.primaryBright,
        controller: controller,
        tabs: _getTabs(),
        labelColor: NbaTheme.white,
        unselectedLabelColor: NbaTheme.white,
        indicatorColor: NbaTheme.primaryBright,
        indicatorWeight: 2.0,
        labelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        padding: EdgeInsets.zero,
      ),
    );
  }
}