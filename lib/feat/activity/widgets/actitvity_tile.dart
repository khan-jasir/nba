import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nba_sdk/feat/activity/repository/models/models.dart';
import 'package:nba_sdk/feat/activity/utils/utils.dart';
import 'package:nba_sdk/feat/activity_detail/cubit/activity_details_cubit.dart';
import 'package:nba_sdk/feat/activity_detail/view/activity_detail_view.dart';
import 'package:nba_sdk/feat/core/theme/nba_theme.dart';
// import 'dart:js_interop';
// import 'package:web/web.dart' as web;

class ActivityTile extends StatelessWidget {
  final ActivityItemModel activity;
  final ActivitySegregatorEnum activitySegregator;
  const ActivityTile({
    super.key,
    required this.activity,
    required this.activitySegregator,
  });

  Color _getPriorityColor(PriorityLevel priorityLevel) {
    if (priorityLevel.isLow) {
      return NbaTheme.lowPriority;
    } else if (priorityLevel.isMedium) {
      return NbaTheme.mediumPriority;
    } else {
      return NbaTheme.highPriority;
    }
  }

  Color _getDateColor() {
    if (activitySegregator.isOverdue) {
      return NbaTheme.highPriority;
    } else if (activitySegregator.isDueToday) {
      return NbaTheme.primaryBright;
    } else {
      return NbaTheme.white;
    }
  }

  Widget get archiveActivityTileHeader {

    Color  _archiveActivityDueDateColor() {
      if(activity.archiveActivityDueToDoneInterval == 0) {
        return NbaTheme.primaryBright;
      } else if(activity.archiveActivityDueToDoneInterval > 0) {
        return NbaTheme.white;
      } else {
        return NbaTheme.highPriority;
      }
    }

    return Row(
      children: [
        Text(
          activity.taskCreatedAtFormattedDate.toUpperCase(),
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: NbaTheme.white,
          ),
        ),
        Gap(10),
        Expanded(
          child: Divider(
            color: Colors.white.withOpacity(0.6),
            thickness: 0.5,
            endIndent: 12,
          ),
        ),
        Gap(10),
        Text(
          activity.dueDateFormattedDate.toUpperCase(),
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: _archiveActivityDueDateColor(),
          ),
        ),
        Gap(5),
        Text(
          '|',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: NbaTheme.white,
          ),
        ),
        Gap(5),
        Text(
          activity.completedOnFormattedDate.toUpperCase(),
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: NbaTheme.success,
          ),
        )
      ],
    );
  }

  Widget get activeActivityTileHeader {
    return Row(
      children: [
        Text(
          activity.formattedStarDate.toUpperCase(),
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: NbaTheme.white,
          ),
        ),
        Gap(10),
        Expanded(
          child: Divider(
            color: Colors.white.withOpacity(0.6),
            thickness: 0.5,
            endIndent: 12,
          ),
        ),
        Gap(10),
        Text(
          activity.formattedEndDate.toUpperCase(),
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: _getDateColor(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(activity.isArchived ||  activity.isTrainingTask) {
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => BlocProvider(
                  create: (context) => ActivityDetailsCubit(),
                  child: ActivityDetailView(
                    activityItem: activity,
                    taskId: activity.id,
                  ),
                ),
          ),
        );

        //    final message = {
        //   'action': 'openActivityDetail',
        //   'activity': activity.toJson(),
        //  };
        //   web.window.parent?.postMessage(message.jsify(), '*'.toJS);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: _getPriorityColor(activity.isArchived ? activity.oldPriorityLevel : activity.priorityLevelOfActivity),
              width: 4,
            ),
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xff1A2A30),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(activity.isArchived) ...[
                archiveActivityTileHeader,
              ] else ...[
                activeActivityTileHeader,
              ],
              Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    activity.taskName,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                activity.taskDescription,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
