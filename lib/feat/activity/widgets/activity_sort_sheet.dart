import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:nba_sdk/feat/activity/utils/activity_filter.dart';
import 'package:nba_sdk/feat/core/theme/nba_theme.dart';


class ActivitySortSheet extends StatelessWidget {
  final ActivitySortBy selectedOption;
  final Function(ActivitySortBy) onOptionSelected;

  const ActivitySortSheet({
    super.key,
    required this.selectedOption,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xff1A2A30),
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sort by',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          Gap(10),
          RadioListTile<ActivitySortBy>(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Priority',
              style: TextStyle(color: Colors.white),
            ),
            value: ActivitySortBy.priority,
            groupValue: selectedOption,
            onChanged: (value) => onOptionSelected(value!),
            activeColor: NbaTheme.primaryBright,
            fillColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.selected)) {
                return NbaTheme.primaryBright;
              }
              return NbaTheme.primaryBright.withOpacity(0.3);
            }),
          ),
          RadioListTile<ActivitySortBy>(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Impact',
              style: TextStyle(color: Colors.white),
            ),
            value: ActivitySortBy.impact,
            groupValue: selectedOption,
            onChanged: (value) => onOptionSelected(value!),
            activeColor: NbaTheme.primaryBright,
            fillColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.selected)) {
                return NbaTheme.primaryBright;
              }
              return NbaTheme.primaryBright.withOpacity(0.3);
            }),
          ),
           RadioListTile<ActivitySortBy>(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Action Type',
              style: TextStyle(color: Colors.white),
            ),
            value: ActivitySortBy.actionType,
            groupValue: selectedOption,
            onChanged: (value) => onOptionSelected(value!),
            activeColor: NbaTheme.primaryBright,
            fillColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.selected)) {
                return NbaTheme.primaryBright;
              }
              return NbaTheme.primaryBright.withOpacity(0.3);
            }),
          ),
           RadioListTile<ActivitySortBy>(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Activity Type',
              style: TextStyle(color: Colors.white),
            ),
            value: ActivitySortBy.activityType,
            groupValue: selectedOption,
            onChanged: (value) => onOptionSelected(value!),
            activeColor: NbaTheme.primaryBright,
            fillColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.selected)) {
                return NbaTheme.primaryBright;
              }
              return NbaTheme.primaryBright.withOpacity(0.3);
            }),
          ),
        ],
      ),
    );
  }
}