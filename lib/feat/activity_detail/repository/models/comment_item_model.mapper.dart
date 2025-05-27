// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'comment_item_model.dart';

class CommentItemModelMapper extends ClassMapperBase<CommentItemModel> {
  CommentItemModelMapper._();

  static CommentItemModelMapper? _instance;
  static CommentItemModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommentItemModelMapper._());
      AttachmentModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CommentItemModel';

  static int? _$id(CommentItemModel v) => v.id;
  static const Field<CommentItemModel, int> _f$id =
      Field('id', _$id, opt: true);
  static int? _$taskId(CommentItemModel v) => v.taskId;
  static const Field<CommentItemModel, int> _f$taskId =
      Field('taskId', _$taskId, opt: true);
  static String? _$commentBy(CommentItemModel v) => v.commentBy;
  static const Field<CommentItemModel, String> _f$commentBy =
      Field('commentBy', _$commentBy, opt: true);
  static String? _$content(CommentItemModel v) => v.content;
  static const Field<CommentItemModel, String> _f$content =
      Field('content', _$content, opt: true);
  static String? _$createdAt(CommentItemModel v) => v.createdAt;
  static const Field<CommentItemModel, String> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static String? _$updatedAt(CommentItemModel v) => v.updatedAt;
  static const Field<CommentItemModel, String> _f$updatedAt =
      Field('updatedAt', _$updatedAt, opt: true);
  static List<AttachmentModel>? _$attachments(CommentItemModel v) =>
      v.attachments;
  static const Field<CommentItemModel, List<AttachmentModel>> _f$attachments =
      Field('attachments', _$attachments, opt: true);

  @override
  final MappableFields<CommentItemModel> fields = const {
    #id: _f$id,
    #taskId: _f$taskId,
    #commentBy: _f$commentBy,
    #content: _f$content,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #attachments: _f$attachments,
  };

  static CommentItemModel _instantiate(DecodingData data) {
    return CommentItemModel(
        id: data.dec(_f$id),
        taskId: data.dec(_f$taskId),
        commentBy: data.dec(_f$commentBy),
        content: data.dec(_f$content),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt),
        attachments: data.dec(_f$attachments));
  }

  @override
  final Function instantiate = _instantiate;

  static CommentItemModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CommentItemModel>(map);
  }

  static CommentItemModel fromJson(String json) {
    return ensureInitialized().decodeJson<CommentItemModel>(json);
  }
}

mixin CommentItemModelMappable {
  String toJson() {
    return CommentItemModelMapper.ensureInitialized()
        .encodeJson<CommentItemModel>(this as CommentItemModel);
  }

  Map<String, dynamic> toMap() {
    return CommentItemModelMapper.ensureInitialized()
        .encodeMap<CommentItemModel>(this as CommentItemModel);
  }

  CommentItemModelCopyWith<CommentItemModel, CommentItemModel, CommentItemModel>
      get copyWith =>
          _CommentItemModelCopyWithImpl<CommentItemModel, CommentItemModel>(
              this as CommentItemModel, $identity, $identity);
  @override
  String toString() {
    return CommentItemModelMapper.ensureInitialized()
        .stringifyValue(this as CommentItemModel);
  }

  @override
  bool operator ==(Object other) {
    return CommentItemModelMapper.ensureInitialized()
        .equalsValue(this as CommentItemModel, other);
  }

  @override
  int get hashCode {
    return CommentItemModelMapper.ensureInitialized()
        .hashValue(this as CommentItemModel);
  }
}

extension CommentItemModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CommentItemModel, $Out> {
  CommentItemModelCopyWith<$R, CommentItemModel, $Out>
      get $asCommentItemModel => $base
          .as((v, t, t2) => _CommentItemModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CommentItemModelCopyWith<$R, $In extends CommentItemModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, AttachmentModel,
          AttachmentModelCopyWith<$R, AttachmentModel, AttachmentModel>>?
      get attachments;
  $R call(
      {int? id,
      int? taskId,
      String? commentBy,
      String? content,
      String? createdAt,
      String? updatedAt,
      List<AttachmentModel>? attachments});
  CommentItemModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CommentItemModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CommentItemModel, $Out>
    implements CommentItemModelCopyWith<$R, CommentItemModel, $Out> {
  _CommentItemModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CommentItemModel> $mapper =
      CommentItemModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, AttachmentModel,
          AttachmentModelCopyWith<$R, AttachmentModel, AttachmentModel>>?
      get attachments => $value.attachments != null
          ? ListCopyWith($value.attachments!, (v, t) => v.copyWith.$chain(t),
              (v) => call(attachments: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? taskId = $none,
          Object? commentBy = $none,
          Object? content = $none,
          Object? createdAt = $none,
          Object? updatedAt = $none,
          Object? attachments = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (taskId != $none) #taskId: taskId,
        if (commentBy != $none) #commentBy: commentBy,
        if (content != $none) #content: content,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt,
        if (attachments != $none) #attachments: attachments
      }));
  @override
  CommentItemModel $make(CopyWithData data) => CommentItemModel(
      id: data.get(#id, or: $value.id),
      taskId: data.get(#taskId, or: $value.taskId),
      commentBy: data.get(#commentBy, or: $value.commentBy),
      content: data.get(#content, or: $value.content),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      attachments: data.get(#attachments, or: $value.attachments));

  @override
  CommentItemModelCopyWith<$R2, CommentItemModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CommentItemModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
