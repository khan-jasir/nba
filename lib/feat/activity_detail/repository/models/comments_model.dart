import 'package:dart_mappable/dart_mappable.dart';
import 'package:nba_sdk/feat/activity_detail/repository/models/comment_item_model.dart';

part 'comments_model.mapper.dart';

@MappableClass()
class CommentsModel with CommentsModelMappable {

  @MappableField(key: 'items')
  List<CommentItemModel>? items;
  @MappableField(key: 'total')
  int? total;
  @MappableField(key: 'size')
  int? size;

  CommentsModel({
    this.items,
    this.total,
    this.size,
  });

}