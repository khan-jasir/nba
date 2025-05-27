import 'package:flutter/material.dart';
import 'package:nba_sdk/feat/activity/utils/activity_screen_type.dart';
import 'package:nba_sdk/feat/activity/view/activity_view.dart';
import 'package:nba_sdk/feat/activity/view/archive_activity_view.dart';
import 'package:nba_sdk/feat/activity/view/archive_calender_view.dart';

class ActivityViewWrapper extends StatefulWidget {
  const ActivityViewWrapper({super.key, required this.screenType, this.selectedArchiveDate});

  final ActivityScreenType screenType;
  final String? selectedArchiveDate;

  @override
  State<ActivityViewWrapper> createState() => _ActivityViewWrapperState();
}

class _ActivityViewWrapperState extends State<ActivityViewWrapper> {
  
  @override
  initState() {
    super.initState();
  }

  Widget _getScreen(ActivityScreenType screenType) {
    switch (screenType) {
      case ActivityScreenType.activity:
        return const ActivityView();
      case ActivityScreenType.archiveCalender:
        return const ArchiveView();
      case ActivityScreenType.archiveActivity:
        return ArchiveActivityView(date: widget.selectedArchiveDate ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getScreen(widget.screenType);
  }
}