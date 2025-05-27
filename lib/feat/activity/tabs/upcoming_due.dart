import 'package:flutter/material.dart';
import 'package:nba_sdk/feat/activity/utils/activity_filter.dart';
import 'package:nba_sdk/feat/activity/utils/utils.dart';
import 'package:nba_sdk/feat/activity/widgets/widgets.dart';
import 'package:nba_sdk/feat/core/theme/nba_theme.dart';

class UpcomingDue extends StatelessWidget {
  const UpcomingDue({super.key, this.activities, this.filter});

  final ActivitySortModel? activities;
  final ActivitySortBy? filter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 40),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ActivtitySort(
              filter: filter,
              activitySegregatorType: ActivitySegregatorEnum.upcoming,
            ),
            if (filter == ActivitySortBy.impact ||
                filter == ActivitySortBy.priority) ...[
              if (activities == null ||
                  (activities!.highList.isEmpty &&
                      activities!.mediumList.isEmpty &&
                      activities!.lowList.isEmpty)) ...[
                Padding(
                    padding: EdgeInsets.only(top: 200),
                    child: const Center(
                      child: Text('No activities found', style: TextStyle(color: NbaTheme.white),),
                    ),
                  )
              ] else ...[
                if (activities!.highList.isNotEmpty) ...[
                  ActivityAccordion(
                    activities:
                        activities!.highList.map((element) {
                          return ActivityTile(
                            activity: element,
                            activitySegregator: ActivitySegregatorEnum.upcoming,
                          );
                        }).toList(),
                    bucket: ActivityBuckets.high,
                  ),
                ],
                if (activities!.mediumList.isNotEmpty) ...[
                  ActivityAccordion(
                    activities:
                        activities!.mediumList.map((element) {
                          return ActivityTile(
                            activity: element,
                            activitySegregator: ActivitySegregatorEnum.upcoming,
                          );
                        }).toList(),
                    bucket: ActivityBuckets.medium,
                  ),
                ],
                if (activities!.lowList.isNotEmpty) ...[
                  ActivityAccordion(
                    activities:
                        activities!.lowList.map((element) {
                          return ActivityTile(
                            activity: element,
                            activitySegregator: ActivitySegregatorEnum.upcoming,
                          );
                        }).toList(),
                    bucket: ActivityBuckets.low,
                  ),
                ],
              ],
            ]
              else if (filter == ActivitySortBy.actionType) ...[

                if(activities == null || (activities!.runYourBusinessList.isEmpty && activities!.growYourBusinessList.isEmpty && activities!.manageRelationshipsList.isEmpty && activities!.selfImprovementList.isEmpty)) ...[
                   Padding(
                    padding: EdgeInsets.only(top: 200),
                    child: const Center(
                      child: Text('No activities found', style: TextStyle(color: NbaTheme.white),),
                    ),
                  )
                ] else ... [
                 if (activities!.runYourBusinessList.isNotEmpty) ...[
                  ActivityAccordion(
                    activities:
                        activities!.runYourBusinessList.map((element) {
                          return ActivityTile(
                            activity: element,
                            activitySegregator: ActivitySegregatorEnum.upcoming,
                          );
                        }).toList(),
                    bucket: ActivityBuckets.runYourBusiness,
                  ),
                ],
                if (activities!.growYourBusinessList.isNotEmpty) ...[
                  ActivityAccordion(
                    activities:
                        activities!.growYourBusinessList.map((element) {
                          return ActivityTile(
                            activity: element,
                            activitySegregator: ActivitySegregatorEnum.upcoming,
                          );
                        }).toList(),
                    bucket: ActivityBuckets.growYourBusiness,
                  ),
                ],
                if (activities!.manageRelationshipsList.isNotEmpty) ...[
                  ActivityAccordion(
                    activities:
                        activities!.manageRelationshipsList.map((element) {
                          return ActivityTile(
                            activity: element,
                            activitySegregator: ActivitySegregatorEnum.upcoming,
                          );
                        }).toList(),
                    bucket: ActivityBuckets.manageRelationships,
                  ),
                ],
                if (activities!.selfImprovementList.isNotEmpty) ...[
                  ActivityAccordion(
                    activities:
                        activities!.selfImprovementList.map((element) {
                          return ActivityTile(
                            activity: element,
                            activitySegregator: ActivitySegregatorEnum.upcoming,
                          );
                        }).toList(),
                    bucket: ActivityBuckets.selfImprovement,
                  ),
                ],
            ],
            // if (filteredActivities == null || (filteredActivities.highList.isEmpty && filteredActivities.mediumList.isEmpty && filteredActivities.lowList.isEmpty)) ...[
            //   const Center(child: Text('No activities found', style: TextStyle(color: NbaTheme.white),)),
            // ] else ...[
            //   Padding(padding: const EdgeInsets.all(16), child: ActivtitySort(filter: widget.filter, activitySegregatorType: ActivitySegregatorEnum.upcoming)),
            //   if(filteredActivities.highList.isNotEmpty) ...[
            //     Padding(
            //       padding: const EdgeInsets.all(16),
            //       child: ActivityAccordion(
            //       bucket: ActivityBuckets.high,
            //       activities:
            //           filteredActivities.highList.map((element) {
            //             return ActivityTile(
            //               activity: element,
            //               activitySegregator: ActivitySegregatorEnum.upcoming,
            //             );
            //           }).toList(),
            //     ),
            //     ),
            //   ],
            //   if(filteredActivities.mediumList.isNotEmpty) ...[
            //     Padding(
            //       padding: const EdgeInsets.all(16),
            //     child: ActivityAccordion(
            //       bucket: ActivityBuckets.medium,
            //       activities:
            //           filteredActivities.mediumList.map((element) {
            //             return ActivityTile(
            //               activity: element,
            //               activitySegregator: ActivitySegregatorEnum.upcoming,
            //             );
            //           }).toList(),
            //     ),
            //   ),
            //   ],
            //   if(filteredActivities.lowList.isNotEmpty) ...[
            //     Padding(
            //       padding: const EdgeInsets.all(16),
            //       child: ActivityAccordion(
            //       bucket: ActivityBuckets.low,
            //       activities:
            //           filteredActivities.lowList.map((element) {
            //             return ActivityTile(
            //               activity: element,
            //               activitySegregator: ActivitySegregatorEnum.upcoming,
            //             );
            //           }).toList(),
            //     ),
            //   ),
            //   ],
            //   ]
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
                      activitySegregator: ActivitySegregatorEnum.upcoming,
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
                      activitySegregator: ActivitySegregatorEnum.upcoming,
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
                      activitySegregator: ActivitySegregatorEnum.upcoming,
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
                      activitySegregator: ActivitySegregatorEnum.upcoming,
                    );
                  }).toList(),
                  bucket: ActivityBuckets.training,
                ),
              ],
            ]
            ]
          ]
        ),
      ),
    );
  }
}
