import 'package:dart_mappable/dart_mappable.dart';
import 'package:nba_sdk/feat/activity_detail/repository/respository.dart';

part 'activity_detail_response_model.mapper.dart';

@MappableClass()
class ActivityDetailResponseModel  with ActivityDetailResponseModelMappable{
  @MappableField(key: 'success')
  final bool success;
  @MappableField(key: 'message')
  final String message;
  @MappableField(key: 'data')
  final ActivityDetailItemModel? data;

  ActivityDetailResponseModel({
    required this.success,
    required this.message,
    this.data,
  });
}