import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nba_sdk/core/di/service_locator.dart';
import 'package:nba_sdk/feat/activity/cubit/activity_cubit.dart';
import 'package:nba_sdk/feat/activity/cubit/activity_state.dart';
import 'package:nba_sdk/feat/activity/repository/activity_repository.dart';
import 'package:nba_sdk/feat/activity/utils/activity_screen_type.dart';
import 'package:nba_sdk/feat/activity/view/activity_view_wrapper.dart';
import 'package:nba_sdk/feat/activity_detail/cubit/activity_details_cubit.dart';
import 'package:nba_sdk/feat/activity_detail/view/activity_detail_view.dart';
import 'package:nba_sdk/feat/notifications/cubit/notification_cubit.dart';
import 'package:nba_sdk/feat/notifications/repository/notification_repository.dart';
import 'package:nba_sdk/feat/notifications/view/notification_view.dart';

import 'core/config/sdk_config.dart';

class NbaSdk {
  static late SdkConfig _config;
  static bool _isInitialized = false;

  static void init(SdkConfig config) async {
    if (_isInitialized) {
      return;
    }
    await ServiceLocator.init(config);
    _config = config;
    _isInitialized = true;
  }

  static Widget home() {
    return BlocProvider(
      create:
          (context) => ActivityCubit(
            activityRepository: ActivityRepositoryImpl(),
          ),
      child: BlocBuilder<ActivityCubit, ActivityState>(
        builder: (context, state) {
          print(state.selectedArchiveDate);
          return ActivityViewWrapper(
            screenType: state.screenType ?? ActivityScreenType.activity,
            selectedArchiveDate: state.selectedArchiveDate,
          );
        },
      ),
    );
  }

  static Widget activityDetails() {
    return BlocProvider(
      create: (context) => ActivityDetailsCubit(),
      child: ActivityDetailView(taskId: '10930',),
    );
  }

  static Widget notification() {
    return BlocProvider(
      create: (context) => NotificationCubit(
        repository: NotificationRepositoryImpl(),
      ),
      child: NotificationView(),
    );
  }
}
