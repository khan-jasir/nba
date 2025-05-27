import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nba_sdk/feat/core/theme/nba_theme.dart';

class DateSelector extends StatefulWidget {
  final DateTime initialDate;
  final int daysCount;
  final ValueChanged<DateTime> onDateSelected;

  const DateSelector({
    super.key,
    required this.initialDate,
    this.daysCount = 15,
    required this.onDateSelected,
  });

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
    // Trigger the callback with initial date
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onDateSelected(widget.initialDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: NbaTheme.primaryDark,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(widget.daysCount, (index) {
            final date = widget.initialDate.add(Duration(days: index));
            final isSelected = date.day == selectedDate.day && date.month == selectedDate.month && date.year == selectedDate.year;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedDate = date;
                });
                widget.onDateSelected(date);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 6),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                decoration: BoxDecoration(
                  color: isSelected ? NbaTheme.grayThree : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      DateFormat('dd').format(date),
                      style: TextStyle(
                        color: isSelected ? NbaTheme.white : NbaTheme.white.withOpacity(0.8),
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      DateFormat('MMM').format(date),
                      style: TextStyle(
                        color: isSelected ? NbaTheme.white : NbaTheme.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      DateFormat('dd').format(date),
                      style: TextStyle(
                        color: NbaTheme.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
} 