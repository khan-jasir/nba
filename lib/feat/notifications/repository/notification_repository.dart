import 'package:dio/dio.dart';
import 'package:nba_sdk/core/network/api_result.dart';
import 'package:nba_sdk/core/repository/base_repository.dart';
import 'package:nba_sdk/feat/notifications/models/notification_model.dart';

abstract class NotificationRepository {
  Future<NotificationModel> getNotifications();
  Future<void> markAsRead(String id);
}

class NotificationRepositoryImpl extends BaseRepository implements NotificationRepository{

  final lan = '34.100.196.105';
  final agentId = 'SOS-000184';

  @override
  Future<NotificationModel> getNotifications() async {
    try {
      final response = await client.get(
        '/nba/api/v1/notifications/agent/$agentId',
        queryParameters: {
          'pageNumber': 0,
          'pageSize': 10,
        },
      );

      if(response is ApiSuccess) {
        return NotificationModelMapper.fromMap(response.data);
      } else {
        throw Exception('Failed to get notifications');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> markAsRead(String id) async {
    try {
      final response = await client.put(
        '/nba/api/v1/notifications/$id/read',
      );

      if(response is ApiSuccess) {
        return;
      } else {
        throw Exception('Failed to mark as read');
      }
    } catch(e) {
      rethrow;
    }
  }
}
