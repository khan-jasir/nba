import 'package:dart_mappable/dart_mappable.dart';
import 'package:nba_sdk/feat/activity_detail/repository/models/comments_model.dart';

part 'fetch_comments_model.mapper.dart';

@MappableClass()
class FetchCommentsModel with FetchCommentsModelMappable {
  @MappableField(key: 'success')
  final bool success;
  @MappableField(key: 'message')
  final String message;
  @MappableField(key: 'data')
  final CommentsModel? data;

  FetchCommentsModel({
    required this.success,
    required this.message,
    this.data,
  });
}