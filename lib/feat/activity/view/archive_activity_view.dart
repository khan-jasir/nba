import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:nba_sdk/feat/activity/cubit/activity_cubit.dart';
import 'package:nba_sdk/feat/activity/cubit/activity_state.dart';
import 'package:nba_sdk/feat/activity/utils/activity_filter.dart';
import 'package:nba_sdk/feat/activity/utils/activity_segregator.dart';
import 'package:nba_sdk/feat/activity/widgets/activity_accordion.dart';
import 'package:nba_sdk/feat/activity/widgets/activity_sort.dart';
import 'package:nba_sdk/feat/core/theme/nba_theme.dart';

import '../widgets/actitvity_tile.dart';


class ArchiveActivityView extends StatefulWidget {
  const ArchiveActivityView({super.key, required this.date});

  final String date;

  @override
  State<ArchiveActivityView> createState() => _ArchiveActivityViewState();
}

class _ArchiveActivityViewState extends State<ArchiveActivityView> {

  @override
  void initState() {
    super.initState();
    context.read<ActivityCubit>().getArchiveActivity(widget.date);
  }

  Widget _buildHeader(BuildContext context) {

    String getFormattedDate(String date) {
      if(date.isEmpty) {
        return '';
      }
      final dateTime = DateTime.parse(date);
      return DateFormat('dd-MMMM-yyyy').format(dateTime);
    }

    return Row(
      children: [
        IconButton(
          onPressed: () {
           context.read<ActivityCubit>().onArchiveActivityBackClicked();
          },
          icon: Icon(Icons.arrow_back, color: NbaTheme.primaryNoraml,),
        ),
        Gap(15),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getFormattedDate(widget.date),
              style: TextStyle(
                color: NbaTheme.white,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            Gap(5),
            Text(
              'Archive',
              style: TextStyle(
                color: NbaTheme.white,
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xff09161C),
      body: Column(
        children: [
          Gap(15),
         _buildHeader(context),
         Gap(20),
         BlocBuilder<ActivityCubit, ActivityState>(
          builder: (context, state) {
            if(state.archiveActivity == null) {
               Padding(
                    padding: EdgeInsets.only(top: 200),
                    child: const Center(
                      child: Text('No activities found', style: TextStyle(color: NbaTheme.white),),
                    ),
                  );
            }
            return Expanded(
              child: _ActivityArchiveListView(
                activities: state.archiveActivity,
                filter: state.archiveFilter,
              ),
            );
          },
         ),
        ],
      ),
    );
  }
}


class _ActivityArchiveListView extends StatelessWidget {
  const _ActivityArchiveListView({super.key, this.activities, this.filter});

  final ActivitySortModel? activities;
  final ActivitySortBy? filter;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 40),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ActivtitySort(filter: filter, activitySegregatorType: ActivitySegregatorEnum.archive),
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
                    activities: activities!.highList.map((element) {
                      return ActivityTile(
                      activity: element,
                      activitySegregator: ActivitySegregatorEnum.upcoming,
                    );
                  }).toList(),
                    bucket: ActivityBuckets.high,
                  ),
                ],
                if(activities!.mediumList.isNotEmpty) ...[
                  ActivityAccordion(
                    activities: activities!.mediumList.map((element) {
                      return ActivityTile(
                      activity: element,
                      activitySegregator: ActivitySegregatorEnum.upcoming,
                    );
                  }).toList(),
                    bucket: ActivityBuckets.medium,
                  ),
                ],
                if(activities!.lowList.isNotEmpty) ...[
                  ActivityAccordion(
                    activities: activities!.lowList.map((element) {
                      return ActivityTile(
                        activity: element,
                        activitySegregator: ActivitySegregatorEnum.upcoming,
                      );
                    }).toList(),
                    bucket: ActivityBuckets.low,
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
                        activitySegregator: ActivitySegregatorEnum.upcoming,
                      );
                    }).toList(),
                    bucket: ActivityBuckets.runYourBusiness,
                  ),
                ],
                if(activities!.growYourBusinessList.isNotEmpty) ...[
                  ActivityAccordion(
                    activities: activities!.growYourBusinessList.map((element) {
                      return ActivityTile(
                        activity: element,
                        activitySegregator: ActivitySegregatorEnum.upcoming,
                      );
                    }).toList(),
                    bucket: ActivityBuckets.growYourBusiness,
                  ),
                ],
                if(activities!.manageRelationshipsList.isNotEmpty) ...[
                  ActivityAccordion(
                    activities: activities!.manageRelationshipsList.map((element) {
                      return ActivityTile(
                        activity: element,
                        activitySegregator: ActivitySegregatorEnum.upcoming,
                      );
                    }).toList(),
                    bucket: ActivityBuckets.manageRelationships,
                  ),
                ],
                if(activities!.selfImprovementList.isNotEmpty) ...[
                  ActivityAccordion(
                    activities: activities!.selfImprovementList.map((element) {
                      return ActivityTile(
                        activity: element,
                        activitySegregator: ActivitySegregatorEnum.upcoming,
                      );
                    }).toList(),
                    bucket: ActivityBuckets.selfImprovement,
                  ),
                ],
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
                ]
              ]
            ]
          ]
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
        ),
      ),
    );
  }
}