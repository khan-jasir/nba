import 'package:flutter/material.dart';
import 'package:nba_sdk/feat/activity/utils/activity_filter.dart';
import 'package:nba_sdk/feat/activity/utils/utils.dart';
import 'package:nba_sdk/feat/activity/widgets/widgets.dart';
import 'package:nba_sdk/feat/core/theme/nba_theme.dart';

class All extends StatelessWidget {
  const All({super.key, this.activities, this.filter});

  final ActivitySortModel? activities;
  final ActivitySortBy? filter;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            if(activities == null || (activities!.highList.isEmpty && activities!.mediumList.isEmpty && activities!.lowList.isEmpty)) ...[
              const Center(
                child: Text('No activities found', style: TextStyle(color: NbaTheme.white),),
              )
            ] else ...[
              ActivtitySort(filter: filter, activitySegregatorType: ActivitySegregatorEnum.all),
              if(activities!.highList.isNotEmpty) ...[
                ActivityAccordion(
                  bucket: ActivityBuckets.high,
                  activities: activities!.highList.map((element) {
                  return ActivityTile(
                    activity: element,
                  activitySegregator: ActivitySegregatorEnum.all,
                  );
                }).toList(),
                ),
              ],
              if(activities!.mediumList.isNotEmpty) ...[
                ActivityAccordion(
                  bucket: ActivityBuckets.medium,
                  activities: activities!.mediumList.map((element) {
                return ActivityTile(
                  activity: element,
                  activitySegregator: ActivitySegregatorEnum.all,
                  );
                }).toList(),
              ),
              ],
              if(activities!.lowList.isNotEmpty) ...[
                ActivityAccordion(
                  bucket: ActivityBuckets.low,
                  activities: activities!.lowList.map((element) {
                return ActivityTile(
                  activity: element,
                  activitySegregator: ActivitySegregatorEnum.all,
                  );
                }).toList(),
              ),
              ]
            ]
          ],
        )
      ),
    );
  }
}