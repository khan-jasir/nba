import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nba_sdk/feat/activity/widgets/activity_comment_section.dart';
import 'package:nba_sdk/feat/activity_detail/cubit/activity_details_cubit.dart';
import 'package:nba_sdk/feat/activity_detail/widgets/activity_details_body.dart';
import 'package:nba_sdk/feat/activity_detail/widgets/activity_details_header.dart';
import 'package:nba_sdk/feat/activity_detail/widgets/take_action_btn.dart';
import 'package:nba_sdk/feat/activity_detail/widgets/take_action_sheet.dart';
import 'package:nba_sdk/feat/core/network/api_status.dart';
import 'package:nba_sdk/feat/core/theme/nba_theme.dart';

import '../../activity/repository/models/models.dart';

class ActivityDetailView extends StatefulWidget {
  const ActivityDetailView({
    super.key,
    this.activityItem,
    required this.taskId,
  });

  final ActivityItemModel? activityItem;
  final String taskId;

  @override
  State<ActivityDetailView> createState() => _ActivityDetailViewState();
}

class _ActivityDetailViewState extends State<ActivityDetailView> {
  @override
  void initState() {
    super.initState();
    context.read<ActivityDetailsCubit>().fetchActivityDetail(widget.taskId);
    context.read<ActivityDetailsCubit>().fetchComments(widget.taskId);
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff0F172A),
      leading: IconButton(
        icon: Icon(Icons.close, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        widget.activityItem?.taskHeader ?? '',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
    );
  }

  void _openTakeActionSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      builder: (context) {
        final width = MediaQuery.of(context).size.width;
        return SizedBox(
          width: width * 0.9,
          child: TakeActionSheet(
            onNoticeReminderPressed: () {},
            onRequestClosurePressed: () {},
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NbaTheme.bgColor,
      appBar: _buildAppBar(context),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 30),
        child: TakeActionBtn(
          title: 'Take Action',
          onPressed: _openTakeActionSheet,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 30),
          child: Column(
            children: [
              BlocBuilder<ActivityDetailsCubit, ActivityDetailsState>(
                builder: (context, state) {
                  final activityDetails = widget.activityItem ?? state.activityDetail;
                  return ActivityDetailsHeader(
                    from: activityDetails?.formattedStarDate ?? '',
                    to: activityDetails?.formattedEndDate ?? '',
                  );
                },
              ),
              Gap(15),
              BlocBuilder<ActivityDetailsCubit, ActivityDetailsState>(
                builder: (context, state) {
                  if (state.activityDetailStatus == ApiStatus.error) {
                    return Center(
                      child: Text(
                        'Failed to load activity detail',
                        style: TextStyle(color: NbaTheme.white),
                      ),
                    );
                  }

                  final activityDetails =
                      widget.activityItem ?? state.activityDetail;
                  return ActivityDetailsBody(activityItem: activityDetails);
                },
              ),
              Gap(15),
              BlocBuilder<ActivityDetailsCubit, ActivityDetailsState>(
                builder: (context, state) {
                  if (state.status == ApiStatus.error) {
                    return Center(
                      child: Text(
                        'Failed to load comments',
                        style: TextStyle(color: NbaTheme.white),
                      ),
                    );
                  }
                  return ActivityCommentSection(
                    comments: state.comments?.data?.items ?? [],
                    taskId: widget.activityItem?.id ?? '',
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
