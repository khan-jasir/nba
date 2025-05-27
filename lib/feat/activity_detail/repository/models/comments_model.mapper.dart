// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'comments_model.dart';

class CommentsModelMapper extends ClassMapperBase<CommentsModel> {
  CommentsModelMapper._();

  static CommentsModelMapper? _instance;
  static CommentsModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommentsModelMapper._());
      CommentItemModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CommentsModel';

  static List<CommentItemModel>? _$items(CommentsModel v) => v.items;
  static const Field<CommentsModel, List<CommentItemModel>> _f$items =
      Field('items', _$items, opt: true);
  static int? _$total(CommentsModel v) => v.total;
  static const Field<CommentsModel, int> _f$total =
      Field('total', _$total, opt: true);
  static int? _$size(CommentsModel v) => v.size;
  static const Field<CommentsModel, int> _f$size =
      Field('size', _$size, opt: true);

  @override
  final MappableFields<CommentsModel> fields = const {
    #items: _f$items,
    #total: _f$total,
    #size: _f$size,
  };

  static CommentsModel _instantiate(DecodingData data) {
    return CommentsModel(
        items: data.dec(_f$items),
        total: data.dec(_f$total),
        size: data.dec(_f$size));
  }

  @override
  final Function instantiate = _instantiate;

  static CommentsModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CommentsModel>(map);
  }

  static CommentsModel fromJson(String json) {
    return ensureInitialized().decodeJson<CommentsModel>(json);
  }
}

mixin CommentsModelMappable {
  String toJson() {
    return CommentsModelMapper.ensureInitialized()
        .encodeJson<CommentsModel>(this as CommentsModel);
  }

  Map<String, dynamic> toMap() {
    return CommentsModelMapper.ensureInitialized()
        .encodeMap<CommentsModel>(this as CommentsModel);
  }

  CommentsModelCopyWith<CommentsModel, CommentsModel, CommentsModel>
      get copyWith => _CommentsModelCopyWithImpl<CommentsModel, CommentsModel>(
          this as CommentsModel, $identity, $identity);
  @override
  String toString() {
    return CommentsModelMapper.ensureInitialized()
        .stringifyValue(this as CommentsModel);
  }

  @override
  bool operator ==(Object other) {
    return CommentsModelMapper.ensureInitialized()
        .equalsValue(this as CommentsModel, other);
  }

  @override
  int get hashCode {
    return CommentsModelMapper.ensureInitialized()
        .hashValue(this as CommentsModel);
  }
}

extension CommentsModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CommentsModel, $Out> {
  CommentsModelCopyWith<$R, CommentsModel, $Out> get $asCommentsModel =>
      $base.as((v, t, t2) => _CommentsModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CommentsModelCopyWith<$R, $In extends CommentsModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, CommentItemModel,
          CommentItemModelCopyWith<$R, CommentItemModel, CommentItemModel>>?
      get items;
  $R call({List<CommentItemModel>? items, int? total, int? size});
  CommentsModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CommentsModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CommentsModel, $Out>
    implements CommentsModelCopyWith<$R, CommentsModel, $Out> {
  _CommentsModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CommentsModel> $mapper =
      CommentsModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, CommentItemModel,
          CommentItemModelCopyWith<$R, CommentItemModel, CommentItemModel>>?
      get items => $value.items != null
          ? ListCopyWith($value.items!, (v, t) => v.copyWith.$chain(t),
              (v) => call(items: v))
          : null;
  @override
  $R call(
          {Object? items = $none,
          Object? total = $none,
          Object? size = $none}) =>
      $apply(FieldCopyWithData({
        if (items != $none) #items: items,
        if (total != $none) #total: total,
        if (size != $none) #size: size
      }));
  @override
  CommentsModel $make(CopyWithData data) => CommentsModel(
      items: data.get(#items, or: $value.items),
      total: data.get(#total, or: $value.total),
      size: data.get(#size, or: $value.size));

  @override
  CommentsModelCopyWith<$R2, CommentsModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CommentsModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
