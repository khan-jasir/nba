import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:nba_sdk/feat/activity/cubit/activity_cubit.dart';
import 'package:nba_sdk/feat/activity/cubit/activity_state.dart';
import 'package:nba_sdk/feat/activity/tabs/tabs.dart';
import 'package:nba_sdk/feat/activity/utils/utils.dart';
import 'package:nba_sdk/feat/activity/utils/activity_filter.dart';
import 'package:nba_sdk/feat/activity/widgets/nba_tabbed_buttons.dart';
import 'package:nba_sdk/feat/activity/widgets/widgets.dart';
import 'package:nba_sdk/feat/core/network/api_status.dart';
import 'package:nba_sdk/feat/core/theme/nba_theme.dart';
import 'package:nba_sdk/feat/activity/view/archive_calender_view.dart';

class ActivityView extends StatefulWidget {
  const ActivityView({super.key});

  @override
  State<ActivityView> createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    context.read<ActivityCubit>().getActivity(null, ActivitySortBy.priority);
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _getTabCount(ActivitySortModel? model) {
    if (model == null) return 0;
    return model.lowList.length +
        model.mediumList.length +
        model.highList.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff09161C),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 16,
              ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Current Task',
                    style: TextStyle(
                      color: NbaTheme.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      context.read<ActivityCubit>().onArchiveClicked();
                    },
                    child: SvgPicture.asset('assets/icons/archive.svg', package: 'nba_sdk',),
                  ),
                ],
              ),
            ),
            // ActivityReportHeader(
            //   totalActivities: 10,
            //   activitiesClosed: 5,
            // ),
            // BlocBuilder<ActivityCubit, ActivityState>(
            //   builder: (context, state) {
            //     final overdueCount = _getTabCount(state.overdueSortModel);
            //     final dueTodayCount = _getTabCount(state.todaySortModel);
            //     final upcomingDueCount = _getTabCount(state.upcomingSortModel);
            //     final allCount = _getTabCount(state.allSortModel);

            //     return NbaTabBar(
            //       controller: _tabController,
            //       tabs: [
            //         ActivityTabs.overdue,
            //         ActivityTabs.dueToday,
            //         ActivityTabs.upcomingDue,
            //         ActivityTabs.all,
            //       ],
            //       tabCounts: [
            //         overdueCount,
            //         dueTodayCount,
            //         upcomingDueCount,
            //         allCount,
            //       ],
            //     );
            //   },
            // ),
            Gap(15),
            BlocBuilder<ActivityCubit, ActivityState>(
              builder: (context, state) {
                return NbaTabbedButtons(
                  selectedTab:
                      state.selectedActivityTab ?? ActivityTabs.overdue,
                  overDueTitle:
                      'Overdue ( ${state.overdueCategoryDetail.completedCount} / ${state.overdueCategoryDetail.totalCount})',
                  dueTodayTitle:
                      'Due Today ( ${state.todayCategoryDetail.completedCount} / ${state.todayCategoryDetail.totalCount})',
                  upcomingDueTitle:
                      'Upcoming Due ( ${state.upcomingCategoryDetail.completedCount} / ${state.upcomingCategoryDetail.totalCount})',
                  onOverDueTap: () {
                    context.read<ActivityCubit>().changeActivityTab(
                      ActivityTabs.overdue,
                    );
                  },
                  onDueTodayTap: () {
                    context.read<ActivityCubit>().changeActivityTab(
                      ActivityTabs.dueToday,
                    );
                  },
                  onUpcomingDueTap: () {
                    context.read<ActivityCubit>().changeActivityTab(
                      ActivityTabs.upcomingDue,
                    );
                  },
                );
              },
            ),
            Gap(15),
            Expanded(
              child: BlocBuilder<ActivityCubit, ActivityState>(
                builder: (context, state) {

                  if(state.activityStatus == ApiStatus.loading) {
                    return Center(child: CircularProgressIndicator(color: NbaTheme.primaryBright,),);
                  }

                  if (state.selectedActivityTab == ActivityTabs.overdue) {
                    return Overdue(
                      activities: state.overdueSortModel,
                      filter: state.overdueFilter,
                    );
                  } else if (state.selectedActivityTab ==
                      ActivityTabs.dueToday) {
                    return DueToday(
                      activities: state.todaySortModel,
                      filter: state.todayFilter,
                    );
                  } else if (state.selectedActivityTab ==
                      ActivityTabs.upcomingDue) {
                    return UpcomingDue(
                      activities: state.upcomingSortModel,
                      filter: state.upcomingFilter,
                    );
                  } else {
                    return Center(child: Text('No activities found'));
                  }
                },
              ),
            ),
            // Expanded(
            //   child: TabBarView(
            //     controller: _tabController,
            //     children: [
            //       BlocBuilder<ActivityCubit, ActivityState>(
            //         builder: (context, state) {
            //           return Overdue(
            //             activities: state.overdueSortModel,
            //             filter: state.overdueFilter,
            //           );
            //         },
            //       ),
            //        BlocBuilder<ActivityCubit, ActivityState>(
            //         builder: (context, state) {
            //           return DueToday(
            //             activities: state.todaySortModel,
            //             filter: state.todayFilter,
            //           );
            //         },
            //       ),
            //        BlocBuilder<ActivityCubit, ActivityState>(
            //         builder: (context, state) {
            //           return UpcomingDue(
            //             activities: state.upcomingSortModel,
            //             filter: state.upcomingFilter,
            //           );
            //         },
            //       ),
            //        BlocBuilder<ActivityCubit, ActivityState>(
            //         builder: (context, state) {
            //           return All(
            //             activities: state.allSortModel,
            //             filter: state.allFilter,
            //           );
            //         },
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
