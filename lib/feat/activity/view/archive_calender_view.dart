import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nba_sdk/feat/activity/cubit/activity_cubit.dart';
import 'package:nba_sdk/feat/core/theme/nba_theme.dart';


class ArchiveView extends StatefulWidget {
  const ArchiveView({super.key});

  @override
  State<ArchiveView> createState() => _ArchiveViewState();
}

class _ArchiveViewState extends State<ArchiveView> {
  DateTime? selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xff09161C),
      // appBar: AppBar(
      //   backgroundColor: NbaTheme.bgColor,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: NbaTheme.white),
      //     onPressed: () => Navigator.of(context).pop(),
      //   ),
      //   title: Text(
      //     'Archive',
      //     style: TextStyle(
      //       color: NbaTheme.white,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 22,
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(15),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<ActivityCubit>().archiveCalenderBackClicked();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: NbaTheme.primaryBright,
                    ),
                  ),
                  Gap(10),
                  Text(
                    'Archive',
                    style: TextStyle(
                      color: NbaTheme.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              ...List.generate(12, (index) => _buildMonthCalendar(context, 2025, index + 1))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMonthCalendar(BuildContext context, int year, int month) {
    final daysInMonth = DateUtils.getDaysInMonth(year, month);
    final firstWeekday = DateTime(year, month, 1).weekday;
    final List<Widget> dayWidgets = [];
    final today = DateTime.now();
    final fifteenDaysAgo = today.subtract(Duration(days: 15));

    // Month header
    dayWidgets.add(
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            '${_monthName(month)} $year',
            style: TextStyle(
              color: NbaTheme.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
    );

    // Days grid
    dayWidgets.add(
      GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1,
        ),
        itemCount: daysInMonth + (firstWeekday - 1),
        itemBuilder: (context, index) {
          if (index < firstWeekday - 1) {
            return const SizedBox();
          }
          final day = index - (firstWeekday - 2);
          final currentDate = DateTime(year, month, day);
          final isToday = currentDate.year == today.year && 
                         currentDate.month == today.month && 
                         currentDate.day == today.day;
          final isSelected = selectedDate?.year == year &&
              selectedDate?.month == month &&
              selectedDate?.day == day;
          final isEnabled = currentDate.isAfter(fifteenDaysAgo) && 
                          !currentDate.isAfter(today);

          return GestureDetector(
            onTap: isEnabled ? () {
              selectedDate = DateTime(year, month, day);
              context.read<ActivityCubit>().onArchiveActivityClicked(selectedDate.toString());
            } : null,
            child: Container(
              decoration: BoxDecoration(
                color: isToday 
                    ? NbaTheme.primaryBright 
                    : isSelected 
                        ? NbaTheme.primaryNoraml 
                        : NbaTheme.grayFour,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                day.toString().padLeft(2, '0'),
                style: TextStyle(
                  color: isToday || isSelected ? Colors.black : NbaTheme.white.withOpacity(isEnabled ? 1.0 : 0.5),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: dayWidgets,
    );
  }

  String _monthName(int month) {
    const months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month];
  }
} 