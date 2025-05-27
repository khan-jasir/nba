
import 'package:nba_sdk/feat/activity/repository/models/activity_item_model.dart';

enum ActivitySegregatorEnum {
  overdue,
  dueToday,
  upcoming,
  all,
  archive,
}

extension ActivitySegregatorEnumExtension on ActivitySegregatorEnum {
 bool get isOverdue => this == ActivitySegregatorEnum.overdue;
 bool get isDueToday => this == ActivitySegregatorEnum.dueToday;
 bool get isUpcoming => this == ActivitySegregatorEnum.upcoming;
 bool get isAll => this == ActivitySegregatorEnum.all;
 bool get isArchive => this == ActivitySegregatorEnum.archive;
}

class ActivityCategoryDetail {
  final List<ActivityItemModel> activities;
  final int totalCount;
  final int completedCount;

  const ActivityCategoryDetail({
    required this.activities,
    required this.totalCount,
    required this.completedCount,
  });
}

class ActivitySegregator {
  /// Segregates activities into three categories based on their due dates
  /// and provides counts for total and completed activities in each.
  ///
  /// Returns a map with three keys:
  /// - 'overdue': Activities whose due date has passed
  /// - 'dueToday': Activities due today
  /// - 'upcoming': Activities due in the future
  static Map<ActivitySegregatorEnum, ActivityCategoryDetail> segregateActivities(
    List<ActivityItemModel> activities,
  ) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final overdueItems = <ActivityItemModel>[];
    final dueTodayItems = <ActivityItemModel>[];
    final upcomingItems = <ActivityItemModel>[];

    int overdueCompletedCount = 0;
    int dueTodayCompletedCount = 0;
    int upcomingCompletedCount = 0;

    for (final activity in activities) {
      // Assuming ActivityItemModel has a boolean field 'isCompleted'
      // If not, this will need adjustment.
      final bool isCompleted = activity.isCompleted; // Or activity.isCompleted, needs actual field name

      if (activity.dueDate == null) {
        // Decide how to handle activities with no due date if necessary
        // For now, they are skipped for categorization by due date.
        continue;
      }

      final dueDateTime = DateTime.parse(activity.dueDate!); // Already checked for null
      final dueDate = DateTime(dueDateTime.year, dueDateTime.month, dueDateTime.day);

      if (dueDate.isBefore(today)) {
        overdueItems.add(activity);
        if (isCompleted) overdueCompletedCount++;
      } else if (dueDate.isAtSameMomentAs(today)) {
        dueTodayItems.add(activity);
        if (isCompleted) dueTodayCompletedCount++;
      } else {
        upcomingItems.add(activity);
        if (isCompleted) upcomingCompletedCount++;
      }
    }

    return {
      ActivitySegregatorEnum.overdue: ActivityCategoryDetail(
        activities: overdueItems,
        totalCount: overdueItems.length,
        completedCount: overdueCompletedCount,
      ),
      ActivitySegregatorEnum.dueToday: ActivityCategoryDetail(
        activities: dueTodayItems,
        totalCount: dueTodayItems.length,
        completedCount: dueTodayCompletedCount,
      ),
      ActivitySegregatorEnum.upcoming: ActivityCategoryDetail(
        activities: upcomingItems,
        totalCount: upcomingItems.length,
        completedCount: upcomingCompletedCount,
      ),
    };
  }

  /// Gets the count of total and completed activities in each category.
  /// Returns a map where keys are ActivitySegregatorEnum and values are
  /// another map with 'total' and 'completed' counts.
  static Map<ActivitySegregatorEnum, Map<String, int>> getActivityCounts(
      List<ActivityItemModel> activities) {
    final segregatedDetails = segregateActivities(activities);
    return {
      ActivitySegregatorEnum.overdue: {
        'total': segregatedDetails[ActivitySegregatorEnum.overdue]!.totalCount,
        'completed': segregatedDetails[ActivitySegregatorEnum.overdue]!.completedCount,
      },
      ActivitySegregatorEnum.dueToday: {
        'total': segregatedDetails[ActivitySegregatorEnum.dueToday]!.totalCount,
        'completed': segregatedDetails[ActivitySegregatorEnum.dueToday]!.completedCount,
      },
      ActivitySegregatorEnum.upcoming: {
        'total': segregatedDetails[ActivitySegregatorEnum.upcoming]!.totalCount,
        'completed': segregatedDetails[ActivitySegregatorEnum.upcoming]!.completedCount,
      },
    };
  }
} 