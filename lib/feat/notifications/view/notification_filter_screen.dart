import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nba_sdk/feat/notifications/cubit/notification_cubit.dart';
import 'package:nba_sdk/feat/notifications/data/notification_type.dart';
import 'package:nba_sdk/feat/notifications/widgets/notification_filter_btn.dart';
import 'package:nba_sdk/feat/notifications/widgets/notification_filter_drop_down.dart';

class NotificationFilterScreen extends StatefulWidget {
  const NotificationFilterScreen({
    super.key,
    required this.onApplyFilter,
    required this.onResetFilter,
  });

  final Function(Set<NotificationType> types) onApplyFilter;
  final Function() onResetFilter;

  @override
  State<NotificationFilterScreen> createState() =>
      _NotificationFilterScreenState();
}

class _NotificationFilterScreenState extends State<NotificationFilterScreen> {
  Set<NotificationType> selectedTypes = {};

  void resetFilters() {
    setState(() {
      selectedTypes = {};
    });
  }

  void applyFilter() {
    final selectedLabels = selectedTypes.map((type) => type.label).join(', ');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          selectedTypes.isEmpty
              ? 'No filters selected'
              : 'Filters applied: $selectedLabels',
        ),
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff09161C),
      appBar: AppBar(
        backgroundColor: const Color(0xff1A2A30),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Text(
              'Filter - Notifications',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.cancel_outlined, color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Notification Type',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
          const SizedBox(height: 8),
          BlocBuilder<NotificationCubit, NotificationState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: NotificationFilterDropdown(
                  selectedTypes: state.selectedNotificationTypes,
                  onChanged: (types) {
                    setState(() {
                      selectedTypes = types;
                    });
                  },
                ),
              );
            },
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration( color: Color(0xff09161C),),
            child: Row(
              children: [
                Expanded(
                  child: NotificationFilterBtn(
                    label: 'RESET FILTERS',
                    onPressed: widget.onResetFilter,
                    backgroundColor: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: NotificationFilterBtn(
                    label: 'APPLY FILTER',
                    onPressed: () {
                      widget.onApplyFilter(selectedTypes);
                    },
                    backgroundColor: const Color(0xff0E86A6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
