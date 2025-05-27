import 'package:flutter/material.dart';
import 'package:nba_sdk/feat/activity/repository/models/models.dart';
import 'package:nba_sdk/feat/activity/utils/activity_filter.dart';
import 'package:nba_sdk/feat/activity/utils/utils.dart';
import 'package:nba_sdk/feat/activity/widgets/widgets.dart';
import 'package:nba_sdk/feat/core/theme/nba_theme.dart';

class DueToday extends StatelessWidget {
  const DueToday({super.key, this.activities, this.filter});

  final ActivitySortModel? activities;
  final ActivitySortBy? filter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
              ActivtitySort(filter: filter, activitySegregatorType: ActivitySegregatorEnum.dueToday),
              if(filter == ActivitySortBy.impact || filter == ActivitySortBy.priority) ...[
                if(activities == null || (activities!.highList.isEmpty && activities!.mediumList.isEmpty && activities!.lowList.isEmpty)) ...[
                  Padding(
                    padding: EdgeInsets.only(top: 200),
                    child: const Center(
                      child: Text('No activities found', style: TextStyle(color: NbaTheme.white),),
                    ),
                  )
                ] else ...[
                   if(activities!.highList.isNotEmpty) ...[
                ActivityAccordion(
                  bucket: ActivityBuckets.high,
                  activities: activities!.highList.map((element) {
                  return ActivityTile(
                    activity: element,
                    activitySegregator: ActivitySegregatorEnum.dueToday,
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
                    activitySegregator: ActivitySegregatorEnum.dueToday,
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
                    activitySegregator: ActivitySegregatorEnum.dueToday,
                  );
                }).toList(),
                ),
              ],
                ]
              ] else if(filter == ActivitySortBy.actionType) ...[
                if(activities == null || (activities!.runYourBusinessList.isEmpty && activities!.growYourBusinessList.isEmpty && activities!.manageRelationshipsList.isEmpty && activities!.selfImprovementList.isEmpty)) ...[
                  Padding(
                    padding: EdgeInsets.only(top: 200),
                    child: const Center(
                      child: Text('No activities found', style: TextStyle(color: NbaTheme.white),),
                    ),
                  )
                ] else ...[
                  if(activities!.runYourBusinessList.isNotEmpty) ...[
                    ActivityAccordion(
                      activities: activities!.runYourBusinessList.map((element) {
                        return ActivityTile(
                          activity: element,
                          activitySegregator: ActivitySegregatorEnum.dueToday,
                        );
                      }).toList(),
                      bucket: ActivityBuckets.runYourBusiness,  
                    )
                  ],
                  if(activities!.growYourBusinessList.isNotEmpty) ...[
                    ActivityAccordion(
                      activities: activities!.growYourBusinessList.map((element) {
                        return ActivityTile(
                          activity: element,
                          activitySegregator: ActivitySegregatorEnum.dueToday,
                        );
                      }).toList(),
                      bucket: ActivityBuckets.growYourBusiness,
                    )
                  ],
                  if(activities!.manageRelationshipsList.isNotEmpty) ...[
                    ActivityAccordion(
                      activities: activities!.manageRelationshipsList.map((element) {
                        return ActivityTile(
                          activity: element,
                          activitySegregator: ActivitySegregatorEnum.dueToday,
                        );
                      }).toList(),
                      bucket: ActivityBuckets.manageRelationships,
                    ) 
                  ],
                  if(activities!.selfImprovementList.isNotEmpty) ...[
                    ActivityAccordion(
                      activities: activities!.selfImprovementList.map((element) {
                        return ActivityTile(
                          activity: element,
                          activitySegregator: ActivitySegregatorEnum.dueToday,
                        );
                      }).toList(),
                      bucket: ActivityBuckets.selfImprovement,
                    )
                  ]
                ]
              ] else ...[
                if(activities == null || (activities!.birthDayWishesList.isEmpty && activities!.crossSellOpportunityList.isEmpty && activities!.failedTransactionList.isEmpty && activities!.trainingList.isEmpty)) ...[
                  Padding(
                    padding: EdgeInsets.only(top: 200),
                    child: const Center(
                      child: Text('No activities found', style: TextStyle(color: NbaTheme.white),),
                    ),
                  )
                ] else ...[
                  if(activities!.birthDayWishesList.isNotEmpty) ...[
                    ActivityAccordion(
                      activities: activities!.birthDayWishesList.map((element) {
                        return ActivityTile(
                          activity: element,
                          activitySegregator: ActivitySegregatorEnum.dueToday,
                        );
                      }).toList(),
                      bucket: ActivityBuckets.birthDayWishes,
                    ),
                  ],
                  if(activities!.crossSellOpportunityList.isNotEmpty) ...[
                    ActivityAccordion(
                      activities: activities!.crossSellOpportunityList.map((element) {
                        return ActivityTile(
                          activity: element,
                          activitySegregator: ActivitySegregatorEnum.dueToday,
                        );
                      }).toList(),
                      bucket: ActivityBuckets.crossSellOpportunity,
                    ),
                  ],
                  if(activities!.failedTransactionList.isNotEmpty) ...[
                    ActivityAccordion(
                      activities: activities!.failedTransactionList.map((element) {
                        return ActivityTile(
                          activity: element,
                          activitySegregator: ActivitySegregatorEnum.dueToday,
                        );
                      }).toList(),
                      bucket: ActivityBuckets.failedTransaction,
                    ),
                  ],
                  if(activities!.trainingList.isNotEmpty) ...[
                    ActivityAccordion(
                      activities: activities!.trainingList.map((element) {
                        return ActivityTile(
                          activity: element,
                          activitySegregator: ActivitySegregatorEnum.dueToday,
                        );
                      }).toList(),
                      bucket: ActivityBuckets.training,
                    ),
                  ]
                ]
              ]
            ]
        ),
      ),
    );
  }
}