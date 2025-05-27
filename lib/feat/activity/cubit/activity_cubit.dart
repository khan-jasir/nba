import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:nba_sdk/core/config/sdk_config.dart';
import 'package:nba_sdk/core/di/service_locator.dart';
import 'package:nba_sdk/feat/activity/cubit/activity_state.dart';
import 'package:nba_sdk/feat/activity/cubit/dummy_response.dart';
import 'package:nba_sdk/feat/activity/repository/activity_repository.dart';
import 'package:nba_sdk/feat/activity/repository/models/models.dart';
import 'package:nba_sdk/feat/activity/utils/activity_filter.dart';
import 'package:nba_sdk/feat/activity/utils/activity_segregator.dart';
import 'package:nba_sdk/feat/activity/utils/tabs_enum.dart';
import 'package:nba_sdk/feat/core/network/network.dart';

import '../utils/activity_screen_type.dart';




class ActivityCubit extends Cubit<ActivityState> {
  ActivityCubit({
    required ActivityRepository activityRepository,
  }) : _activityRepository = activityRepository, super(ActivityState());
  

  ActivityRepository _activityRepository;

  Future<void> getActivity(String? date, ActivitySortBy? sortBy) async {
    try {
      emit(state.copyWith(activityStatus: ApiStatus.loading));

     final response = await _activityRepository.getActivity(date, sortBy);
     // final response = ActivityModelMapper.fromMap(dummyTaskResponse);
      final segregatedActivities = ActivitySegregator.segregateActivities(response.data.items ?? []);

      emit(state.copyWith(
        activityStatus: ApiStatus.success,
        allActivity: response.data.items ?? <ActivityItemModel>[],
        overdueCategoryDetail: segregatedActivities[ActivitySegregatorEnum.overdue],
        todayCategoryDetail: segregatedActivities[ActivitySegregatorEnum.dueToday],
        upcomingCategoryDetail: segregatedActivities[ActivitySegregatorEnum.upcoming],
        overdueActivity: segregatedActivities[ActivitySegregatorEnum.overdue]?.activities ?? <ActivityItemModel>[],
        todayActivity: segregatedActivities[ActivitySegregatorEnum.dueToday]?.activities ?? <ActivityItemModel>[],
        upcomingActivity: segregatedActivities[ActivitySegregatorEnum.upcoming]?.activities ?? <ActivityItemModel>[],
        overdueSortModel: ActivitySortManager.sort(segregatedActivities[ActivitySegregatorEnum.overdue]?.activities ?? <ActivityItemModel>[], state.overdueFilter),
        todaySortModel: ActivitySortManager.sort(segregatedActivities[ActivitySegregatorEnum.dueToday]?.activities ?? <ActivityItemModel>[], state.todayFilter),
        upcomingSortModel: ActivitySortManager.sort(segregatedActivities[ActivitySegregatorEnum.upcoming]?.activities ?? <ActivityItemModel>[], state.upcomingFilter),
        allSortModel: ActivitySortManager.sort(response.data.items ?? <ActivityItemModel>[], state.allFilter),
      ));
    } catch(e) {
      emit(state.copyWith(activityStatus: ApiStatus.error));
    }
  }

  Future<void> sortForOverdue(ActivitySortBy filter) async {
    emit(state.copyWith(overdueFilter: filter));
    getActivity(null, filter);
    //emit(state.copyWith(overdueSortModel: ActivitySortManager.sort(state.overdueActivity, filter)));
  }

  Future<void> sortForToday(ActivitySortBy filter) async {
    emit(state.copyWith(todayFilter: filter));
    getActivity(null, filter);
    //emit(state.copyWith(todaySortModel: ActivitySortManager.sort(state.todayActivity, filter)));
  }

  Future<void> sortForUpcoming(ActivitySortBy filter) async {
    emit(state.copyWith(upcomingFilter: filter));
    getActivity(null, filter);
    //emit(state.copyWith(upcomingSortModel: ActivitySortManager.sort(state.upcomingActivity, filter)));
  }

  Future<void> sortForAll(ActivitySortBy filter) async {
    emit(state.copyWith(allFilter: filter));
    getActivity(null, filter);
    //emit(state.copyWith(allSortModel: ActivitySortManager.sort(state.allActivity, filter)));
  }

  void changeActivityTab(ActivityTabs tab) {
    emit(state.copyWith(selectedActivityTab: tab));
  }

  void onArchiveClicked() {
    emit(state.copyWith(screenType: ActivityScreenType.archiveCalender));
  }

  void archiveCalenderBackClicked() {
    emit(state.copyWith(screenType: ActivityScreenType.activity));
  }

  void onArchiveActivityBackClicked() {
    emit(state.copyWith(screenType: ActivityScreenType.archiveCalender));
  }

  void onArchiveActivityClicked(String date) {
    emit(state.copyWith(screenType: ActivityScreenType.archiveActivity, selectedArchiveDate: date));
  }

  void getArchiveActivity(String date) async {
    try {
      emit(state.copyWith(archiveStatus: ApiStatus.loading));

     final response = await _activityRepository.getArchiveActivity(date);
      // final response = ActivityModelMapper.fromMap(dummyArchiveResponse);
      emit(
        state.copyWith(
          archiveStatus: ApiStatus.success,
          archiveActivity: ArchiveActivitySortManager.sort(response.data.items ?? [], state.archiveFilter),
         archiveAllActivity: response.data.items ?? [],
        )
      );
    } catch(e) {
      emit(state.copyWith(archiveStatus: ApiStatus.error));
    }
  }

  void sortForArchive(ActivitySortBy filter) {
    emit(state.copyWith(archiveFilter: filter));
    emit(state.copyWith(archiveActivity: ArchiveActivitySortManager.sort(state.archiveAllActivity, filter)));
  }
}