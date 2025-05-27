import 'package:dart_mappable/dart_mappable.dart';
import 'package:nba_sdk/feat/notifications/models/notification_item_model.dart';

part 'notification_model.mapper.dart';

@MappableClass()
class NotificationModel with NotificationModelMappable {
  @MappableField(key: 'totalCount')
  final int? totalCount;
  @MappableField(key: 'unreadCount')
  final int? unreadCount;
  @MappableField(key: 'hasMore')
  final bool? hasMore;
  @MappableField(key: 'pageNumber')
  final int? pageNumber;
  @MappableField(key: 'pageSize')
  final int? pageSize;
  @MappableField(key: 'notifications')
  final List<NotificationItemModel>? notifications;

  NotificationModel({
    this.totalCount,
    this.unreadCount,
    this.hasMore,
    this.pageNumber,
    this.pageSize,
    this.notifications,
  });
  
}

