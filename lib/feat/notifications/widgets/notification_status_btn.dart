import 'package:flutter/material.dart';


enum NotificationStatus {
  read('READ'),
  unread('UNREAD');

  final String value;

  const NotificationStatus(this.value);
}

extension NotificationStatusX on NotificationStatus {
  bool get isRead => this == NotificationStatus.read;
  bool get isUnread => this == NotificationStatus.unread;
}

class NotificationStatusButtons extends StatelessWidget {
  const NotificationStatusButtons({super.key, required this.selectedNotificationStatus, required this.onSelectedNotificationStatusChanged});

  final NotificationStatus selectedNotificationStatus;
  final Function(NotificationStatus) onSelectedNotificationStatusChanged;

  Color _getColor(NotificationStatus status) {
    return status == selectedNotificationStatus ?
     Color(0xff0A5F75) :
      Color(0xff1A2A30);
  }

  Widget _getButton(
    BuildContext context,
    NotificationStatus status,
  ) {
    return GestureDetector(
      onTap: () => onSelectedNotificationStatusChanged(status),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: _getColor(status)
        ),
        child: Text(
          status.value,
          style: TextStyle(
            color: Color(0xffF3F3F3),
            fontSize: 16,
            fontWeight: FontWeight.w700
      
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getButton(context, NotificationStatus.read),
        SizedBox(width: 10,),
        _getButton(context, NotificationStatus.unread)
      ],
    );
  }
}