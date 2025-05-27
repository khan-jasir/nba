
import 'package:equatable/equatable.dart';
import 'package:nba_sdk/feat/activity/repository/models/activity_item_model.dart';
import 'package:nba_sdk/feat/activity/utils/activity_filter.dart';
import 'package:nba_sdk/feat/activity/utils/activity_screen_type.dart';
import 'package:nba_sdk/feat/activity/utils/activity_segregator.dart';
import 'package:nba_sdk/feat/activity/utils/tabs_enum.dart';
import 'package:nba_sdk/feat/core/network/api_status.dart';

class ActivityState extends Equatable {
  const ActivityState({
    this.activityStatus = ApiStatus.initial,
    this.archiveStatus = ApiStatus.initial,
    this.archiveAllActivity = const [],
    this.allActivity = const [],
    this.archiveActivity,
    this.overdueActivity = const [],
    this.todayActivity = const [],
    this.upcomingActivity = const [],
    this.allFilter = ActivitySortBy.priority,
    this.overdueFilter = ActivitySortBy.priority,
    this.todayFilter = ActivitySortBy.priority,
    this.upcomingFilter = ActivitySortBy.priority,
    this.archiveFilter = ActivitySortBy.priority,
    this.overdueSortModel,
    this.todaySortModel,
    this.upcomingSortModel,
    this.allSortModel,
    this.selectedActivityTab = ActivityTabs.overdue,
    this.overdueCategoryDetail = const ActivityCategoryDetail(activities: [], totalCount: 0, completedCount: 0),
    this.todayCategoryDetail = const ActivityCategoryDetail(activities: [], totalCount: 0, completedCount: 0),
    this.upcomingCategoryDetail = const ActivityCategoryDetail(activities: [], totalCount: 0, completedCount: 0),
    this.screenType = ActivityScreenType.activity,
    this.selectedArchiveDate,
  });

  final ApiStatus activityStatus;
  final ApiStatus archiveStatus;
  final List<ActivityItemModel> allActivity;
  final List<ActivityItemModel> archiveAllActivity;
  final ActivitySortModel? archiveActivity;
  final List<ActivityItemModel> overdueActivity;
  final List<ActivityItemModel> todayActivity;
  final List<ActivityItemModel> upcomingActivity;
  final ActivityCategoryDetail overdueCategoryDetail;
  final ActivityCategoryDetail todayCategoryDetail;
  final ActivityCategoryDetail upcomingCategoryDetail;
  final ActivitySortBy allFilter;
  final ActivitySortBy overdueFilter;
  final ActivitySortBy todayFilter;
  final ActivitySortBy upcomingFilter;
  final ActivitySortModel? overdueSortModel;
  final ActivitySortModel? todaySortModel;
  final ActivitySortModel? upcomingSortModel;
  final ActivitySortModel? allSortModel;
  final ActivityTabs? selectedActivityTab;
  final ActivityScreenType? screenType;
  final ActivitySortBy archiveFilter;
  final String? selectedArchiveDate;


  ActivityState copyWith({
    ApiStatus? activityStatus,
    ApiStatus? archiveStatus,
    List<ActivityItemModel>? allActivity,
    List<ActivityItemModel>? archiveAllActivity,
    ActivitySortModel? archiveActivity,
    List<ActivityItemModel>? overdueActivity,
    List<ActivityItemModel>? todayActivity,
    List<ActivityItemModel>? upcomingActivity,
    ActivitySortBy? allFilter,
    ActivitySortBy? overdueFilter,
    ActivitySortBy? todayFilter,
    ActivitySortBy? upcomingFilter,
    ActivitySortModel? overdueSortModel,
    ActivitySortModel? todaySortModel,
    ActivitySortModel? upcomingSortModel,
    ActivitySortModel? allSortModel,
    ActivityTabs? selectedActivityTab,
    ActivityCategoryDetail? overdueCategoryDetail,
    ActivityCategoryDetail? todayCategoryDetail,
    ActivityCategoryDetail? upcomingCategoryDetail,
    ActivityScreenType? screenType,
    ActivitySortBy? archiveFilter,
    String? selectedArchiveDate,
  }) {
    return ActivityState(
      activityStatus: activityStatus ?? this.activityStatus,
      archiveStatus: archiveStatus ?? this.archiveStatus,
      allActivity: allActivity ?? this.allActivity,
      archiveAllActivity: archiveAllActivity ?? this.archiveAllActivity,
      archiveActivity: archiveActivity ?? this.archiveActivity,
      overdueActivity: overdueActivity ?? this.overdueActivity,
      todayActivity: todayActivity ?? this.todayActivity,
      upcomingActivity: upcomingActivity ?? this.upcomingActivity,
      allFilter: allFilter ?? this.allFilter,
      overdueFilter: overdueFilter ?? this.overdueFilter,
      todayFilter: todayFilter ?? this.todayFilter,
      upcomingFilter: upcomingFilter ?? this.upcomingFilter,
      overdueSortModel: overdueSortModel ?? this.overdueSortModel,
      todaySortModel: todaySortModel ?? this.todaySortModel,
      upcomingSortModel: upcomingSortModel ?? this.upcomingSortModel,
      allSortModel: allSortModel ?? this.allSortModel,
      selectedActivityTab: selectedActivityTab ?? this.selectedActivityTab,
      overdueCategoryDetail: overdueCategoryDetail ?? this.overdueCategoryDetail,
      todayCategoryDetail: todayCategoryDetail ?? this.todayCategoryDetail,
      upcomingCategoryDetail: upcomingCategoryDetail ?? this.upcomingCategoryDetail,
      screenType: screenType ?? this.screenType,
      archiveFilter: archiveFilter ?? this.archiveFilter,
      selectedArchiveDate: selectedArchiveDate ?? this.selectedArchiveDate,
    );
  }

  @override
  List<Object?> get props => [
    activityStatus,
    archiveStatus,
    archiveActivity,
    archiveAllActivity,
    allActivity,
    overdueActivity,
    todayActivity,
    upcomingActivity,
    allFilter,
    overdueFilter,
    todayFilter,
    upcomingFilter,
    overdueSortModel,
    todaySortModel,
    upcomingSortModel,
    allSortModel,
    selectedActivityTab,
    overdueCategoryDetail,
    todayCategoryDetail,
    upcomingCategoryDetail,
    screenType,
    archiveFilter,
    selectedArchiveDate,
  ];
}


