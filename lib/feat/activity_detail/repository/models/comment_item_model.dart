import 'package:dart_mappable/dart_mappable.dart';
import 'package:nba_sdk/feat/activity_detail/repository/models/attachment_model.dart';

part 'comment_item_model.mapper.dart';

@MappableClass()
class CommentItemModel with CommentItemModelMappable {
  @MappableField(key: 'id')
  final int? id;
  @MappableField(key: 'taskId')
  final int? taskId;
  @MappableField(key: 'commentBy')
  final String? commentBy;
  @MappableField(key: 'content')
  final String? content;
  @MappableField(key: 'createdAt')
  final String? createdAt;
  @MappableField(key: 'updatedAt')
  final String? updatedAt;
  @MappableField(key: 'attachments')
  final List<AttachmentModel>? attachments;


  CommentItemModel({
    this.id,
    this.taskId,
    this.commentBy,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.attachments,
  });
}
