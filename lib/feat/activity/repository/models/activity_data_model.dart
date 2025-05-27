import 'package:dart_mappable/dart_mappable.dart';
import 'package:nba_sdk/feat/activity/repository/models/activity_item_model.dart';

part 'activity_data_model.mapper.dart';

@MappableClass()
class ActivityDataModel with ActivityDataModelMappable {
  @MappableField(key: 'items')
  final List<ActivityItemModel>? items;
  @MappableField(key: 'total')
  final int total;
  @MappableField(key: 'size')
  final int size;

  ActivityDataModel({
    this.items,
    required this.total,
    required this.size,
  });
}
