import 'package:dart_mappable/dart_mappable.dart';
import 'package:nba_sdk/feat/activity/repository/models/activity_data_model.dart';

part 'activity_model.mapper.dart';

@MappableClass()
class ActivityModel  with ActivityModelMappable{
  @MappableField(key: 'success')
  final bool success;
  @MappableField(key: 'message')
  final String message;
  @MappableField(key: 'data')
  final ActivityDataModel data;

  ActivityModel({required this.success, required this.message, required this.data});
}
