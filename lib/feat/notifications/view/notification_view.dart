import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:nba_sdk/feat/activity_detail/cubit/activity_details_cubit.dart';
import 'package:nba_sdk/feat/activity_detail/view/activity_detail_view.dart';
import 'package:nba_sdk/feat/core/network/api_status.dart';
import 'package:nba_sdk/feat/core/theme/nba_theme.dart';
import 'package:nba_sdk/feat/notifications/cubit/notification_cubit.dart';
import 'package:nba_sdk/feat/notifications/data/notification_type.dart';
import 'package:nba_sdk/feat/notifications/view/notification_filter_screen.dart';
import 'package:nba_sdk/feat/notifications/widgets/notification_container.dart';
import 'package:nba_sdk/feat/notifications/widgets/notification_status_btn.dart';
import 'package:nba_sdk/feat/notifications/widgets/notification_tile.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationCubit>().getNotifications();
  }

  void _navigateToActivityDetail(String id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return BlocProvider(
            create: (context) => ActivityDetailsCubit(),
            child: ActivityDetailView(taskId: id),
          );
        },
      ),
    );
  }

  Widget _notificationFilterBtn(int length) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: NbaTheme.primaryDark,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$length types',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          Gap(10),
          GestureDetector(
            onTap: () {
              context.read<NotificationCubit>().resetFilters();
            },
            child: Icon(
              Icons.close,
              color: Colors.white,
            ),
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff09161C),
      appBar: AppBar(
        backgroundColor: Color(0xff1A2A30),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        centerTitle: true,
        title: Row(
          children: [
            Text(
              'Notifications',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (newRouteContext) {
                      return BlocProvider.value(
                        value: context.read<NotificationCubit>(),
                        child: NotificationFilterScreen(
                          onApplyFilter: (Set<NotificationType> types) {
                            context.read<NotificationCubit>().addFilters(types);
                          },
                          onResetFilter: () {
                            context.read<NotificationCubit>().resetFilters();
                          },
                        ),
                      );
                    },
                  ),
                );
              },
              child: SvgPicture.asset(
                'assets/icons/notification_filter_list.svg',
                package: 'nba_sdk',
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<NotificationCubit, NotificationState>(
                builder: (context, state) {
                  if(state.selectedNotificationTypes.isEmpty) {
                    return SizedBox.shrink();
                  }
                  return Padding(
                    padding: EdgeInsets.all(15),
                    child: _notificationFilterBtn(state.selectedNotificationTypes.length),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: BlocBuilder<NotificationCubit, NotificationState>(
                  buildWhen:
                      (previous, current) =>
                          previous.selectedNotificationStatus !=
                          current.selectedNotificationStatus,
                  builder: (context, state) {
                    return NotificationStatusButtons(
                      selectedNotificationStatus:
                          state.selectedNotificationStatus,
                      onSelectedNotificationStatusChanged: (status) {
                        context
                            .read<NotificationCubit>()
                            .toggleNotificationStatus(status);
                      },
                    );
                  },
                ),
              ),
              BlocBuilder<NotificationCubit, NotificationState>(
                builder: (context, state) {
                  if (state.notifcationApiStatus == ApiStatus.loading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff0E86A6),
                      ),
                    );
                  } else if (state.isEmpty) {
                    return const Center(
                      child: Text(
                        'No notifications found',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: state.notifications.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children:
                            state.notifications[index].notifications.isNotEmpty
                                ? [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    child: NotificationContainer(
                                      date: state.notifications[index].date,
                                    ),
                                  ),
                                  for (
                                    int i = 0;
                                    i <
                                        state
                                            .notifications[index]
                                            .notifications
                                            .length;
                                    i++
                                  ) ...[
                                    GestureDetector(
                                      onTap: () {
                                        context
                                            .read<NotificationCubit>()
                                            .markAsRead(
                                              state
                                                  .notifications[index]
                                                  .notifications[i]
                                                  .id,
                                            );
                                        _navigateToActivityDetail(state.notifications[index].notifications[i].sourceId);
                                      },
                                      child: NotificationTile(
                                        title:
                                            state
                                                .notifications[index]
                                                .notifications[i]
                                                .title,
                                        description:
                                            state
                                                .notifications[index]
                                                .notifications[i]
                                                .message,
                                        time:
                                            state
                                                .notifications[index]
                                                .notifications[i]
                                                .sentAt ??
                                            '',
                                        status:
                                            state
                                                .notifications[index]
                                                .notifications[i]
                                                .notificationStatus,
                                      ),
                                    ),
                                  ],
                                ]
                                : [],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
