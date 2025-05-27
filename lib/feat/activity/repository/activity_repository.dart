import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:nba_sdk/core/network/api_client.dart';
import 'package:nba_sdk/core/network/api_result.dart';
import 'package:nba_sdk/core/network/dio_client.dart';
import 'package:nba_sdk/core/repository/base_repository.dart';
import 'package:nba_sdk/feat/activity/repository/models/models.dart';
import 'package:nba_sdk/core/config/sdk_config.dart';
import 'package:nba_sdk/feat/activity/utils/activity_filter.dart';
import 'package:nba_sdk/feat/activity/widgets/widgets.dart';

abstract class ActivityRepository {
  Future<ActivityModel> getActivity(String? date, ActivitySortBy? sortBy);
  Future<ActivityModel> getArchiveActivity(String? date);
}

class ActivityRepositoryImpl extends BaseRepository implements ActivityRepository {


  ActivityRepositoryImpl();

  final agentId = 'SOS-000184';

  @override
  Future<ActivityModel> getActivity(String? date, ActivitySortBy? sortBy) async {
     try {
      // current date in yyyy-mm-dd format
      final currentDate = DateTime.now().toIso8601String().split('T')[0];
      date ??= currentDate;

      final response = await client.get(
        '/nba/api/v1/task/$agentId',
        queryParameters: {
          'date': date,
          'sort': sortBy?.value.toLowerCase() ?? ActivitySortBy.priority.value.toLowerCase(),
        }
      );

      if (response is ApiSuccess) {
        return ActivityModelMapper.fromMap(response.data);
      } else {
        throw Exception('Failed to load tasks: ${response.error}');
      }
    } catch (e) {
      throw Exception('Failed to load tasks: $e');
    }
  }

  @override
  Future<ActivityModel> getArchiveActivity(String? date) async {

    final formattedDate = date?.split(' ')[0] ?? '';
    try {
      final response = await client.get(
        '/nba/api/v1/archive/task/$agentId',
        queryParameters: {
          'date': formattedDate,
        }
      );
      if (response is ApiSuccess) {
        return ActivityModelMapper.fromMap(response.data);
      } else {
        throw Exception('Failed to load archive tasks: ${response.error}');
      }
    } catch (e) {
      throw Exception('Failed to load archive tasks: $e');
    }
  }
}

