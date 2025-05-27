import 'package:intl/intl.dart';
import 'package:nba_sdk/feat/notifications/data/notification_type.dart';
import 'package:nba_sdk/feat/notifications/models/notification_item_model.dart';
import 'package:nba_sdk/feat/notifications/widgets/notification_status_btn.dart';

class NotificationFilterModel {
  String date;
  List<NotificationItemModel> notifications;

  NotificationFilterModel({
    required this.date,
    required this.notifications,
  });
}

class NotificationFilter {

  static (List<NotificationFilterModel>, bool) getNotificationFilter(
    List<NotificationItemModel> notifications,
    NotificationStatus status,
    Set<NotificationType> types,
  ) {
    final dateFormat = DateFormat('yyyy-MM-dd');
    final displayFormat = DateFormat('yyyy-MM-dd');
    
    final uniqueDates = notifications.map((notification) => 
      dateFormat.parse(notification.sentAt ?? DateTime.now().toString())
    ).toSet().toList();

    bool isEmpty = true;
    
    final filteredNotifications = uniqueDates.map((date) => NotificationFilterModel(
      date: displayFormat.format(date),
      notifications: notifications.where((notification) {
        if(types.isEmpty) {
          final isSelected = dateFormat.parse(notification.sentAt ?? DateTime.now().toString()) == date &&
            notification.notificationStatus == status;
          if(isSelected) {
            isEmpty = false;
          }
          return isSelected;
        } else {
          final isSelected = dateFormat.parse(notification.sentAt ?? DateTime.now().toString()) == date &&
            types.contains(notification.notificationType) &&
            notification.notificationStatus == status;
          if(isSelected) {
            isEmpty = false;
          }
          return isSelected;
        }
      }
        
      ).toList()
    )).toList();

    return (filteredNotifications, isEmpty);
  }

}
