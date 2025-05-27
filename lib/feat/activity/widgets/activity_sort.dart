import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:nba_sdk/feat/activity/cubit/activity_cubit.dart';
import 'package:nba_sdk/feat/activity/utils/activity_filter.dart';
import 'package:nba_sdk/feat/activity/utils/activity_segregator.dart';
import 'package:nba_sdk/feat/activity/widgets/activity_sort_sheet.dart';
import 'package:nba_sdk/feat/core/theme/nba_theme.dart';



class ActivtitySort extends StatelessWidget {
  const ActivtitySort({super.key, this.filter, this.activitySegregatorType});

  final ActivitySortBy? filter;
  final ActivitySegregatorEnum? activitySegregatorType;

  void openSortSheet(BuildContext context) {

    void sortActivtity(ActivitySortBy option) {
      switch(activitySegregatorType) {
        case ActivitySegregatorEnum.overdue:
          context.read<ActivityCubit>().sortForOverdue(option);
        case ActivitySegregatorEnum.dueToday:
          context.read<ActivityCubit>().sortForToday(option);
        case ActivitySegregatorEnum.upcoming:
          context.read<ActivityCubit>().sortForUpcoming(option);
        case ActivitySegregatorEnum.all:
          context.read<ActivityCubit>().sortForAll(option);
        case ActivitySegregatorEnum.archive:
          context.read<ActivityCubit>().sortForArchive(option);
        default:
          break;
      }
    }
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 100),
        child: ActivitySortSheet(
          selectedOption: filter ?? ActivitySortBy.priority,
          onOptionSelected: (option) {
            Navigator.pop(context);
            sortActivtity(option);
          },
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sorted by:',
          style: TextStyle(
            color: NbaTheme.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Gap(5),
        Text(
          filter?.value ?? 'Priority',
          style: TextStyle(
            color: NbaTheme.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () => openSortSheet(context),
          child: SvgPicture.asset(
            'assets/icons/filter.svg',
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(NbaTheme.primaryBright, BlendMode.srcIn),
            package: 'nba_sdk',
          ),
        ),
      ],
    );
  }
}