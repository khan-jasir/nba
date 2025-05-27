import 'package:dart_mappable/dart_mappable.dart';
import 'package:nba_sdk/feat/notifications/data/notification_type.dart';
import 'package:nba_sdk/feat/notifications/widgets/notification_status_btn.dart';

part 'notification_item_model.mapper.dart';

@MappableClass()
class NotificationItemModel with NotificationItemModelMappable {

  @MappableField(key: 'id')
  final String id;

  @MappableField(key: 'title')
  final String title;

  @MappableField(key: 'message')
  final String message;
  @MappableField(key: 'status')
  final String status;
  @MappableField(key: 'priorityLevel')
  final String priorityLevel;
  @MappableField(key: 'queryParams')
  final Map<String,String> queryParams;
  @MappableField(key: 'agentId')
  final String agentId;
  @MappableField(key: 'source')
  final String source;
  @MappableField(key: 'sourceId')
  final String sourceId;
  @MappableField(key: 'sentAt')
  final String? sentAt;
  @MappableField(key: 'readAt')
  final String? readAt;
  @MappableField(key: 'dismissedAt')
  final String? dismissedAt;
  @MappableField(key: 'label')
  final String? label;

  NotificationItemModel({
    required this.id,
    required this.title,
    required this.message,
    required this.status,
    required this.priorityLevel,
    required this.queryParams,
    required this.agentId,
    required this.source,
    required this.sourceId,
    this.sentAt,
    this.readAt,
    this.dismissedAt,
    this.label,
  });

  NotificationStatus get notificationStatus => isRead ? NotificationStatus.read : NotificationStatus.unread;

  bool get isRead => status.toLowerCase() == 'read';

  bool get isUnread => status.toLowerCase() == 'unread';


  NotificationType get notificationType {
    if(title.toLowerCase().contains('birthday')) {
      return NotificationType.birthday;
    } else if(title.toLowerCase().contains('belt level')) {
      return NotificationType.beltLevelUpdates;
    } else if(title.toLowerCase().contains('webinar')) {
      return NotificationType.webinarAlerts;
    } else if(title.toLowerCase().contains('new product')) {
      return NotificationType.newProductTraining;
    } else if(title.toLowerCase().contains('up-sell')) {
      return NotificationType.upSellCrossSell;
    } else if(title.toLowerCase().contains('cross-sell')) {
      return NotificationType.upSellCrossSell;
    } else if(title.toLowerCase().contains('payment')) {
      return NotificationType.paymentFailures;
    } else if(title.toLowerCase().contains('new lead')) {
      return NotificationType.newLeadAssignments;
    }
    return NotificationType.birthday;
  }
}