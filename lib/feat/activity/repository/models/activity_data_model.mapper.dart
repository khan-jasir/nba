// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'activity_data_model.dart';

class ActivityDataModelMapper extends ClassMapperBase<ActivityDataModel> {
  ActivityDataModelMapper._();

  static ActivityDataModelMapper? _instance;
  static ActivityDataModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ActivityDataModelMapper._());
      ActivityItemModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ActivityDataModel';

  static List<ActivityItemModel>? _$items(ActivityDataModel v) => v.items;
  static const Field<ActivityDataModel, List<ActivityItemModel>> _f$items =
      Field('items', _$items, opt: true);
  static int _$total(ActivityDataModel v) => v.total;
  static const Field<ActivityDataModel, int> _f$total = Field('total', _$total);
  static int _$size(ActivityDataModel v) => v.size;
  static const Field<ActivityDataModel, int> _f$size = Field('size', _$size);

  @override
  final MappableFields<ActivityDataModel> fields = const {
    #items: _f$items,
    #total: _f$total,
    #size: _f$size,
  };

  static ActivityDataModel _instantiate(DecodingData data) {
    return ActivityDataModel(
        items: data.dec(_f$items),
        total: data.dec(_f$total),
        size: data.dec(_f$size));
  }

  @override
  final Function instantiate = _instantiate;

  static ActivityDataModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ActivityDataModel>(map);
  }

  static ActivityDataModel fromJson(String json) {
    return ensureInitialized().decodeJson<ActivityDataModel>(json);
  }
}

mixin ActivityDataModelMappable {
  String toJson() {
    return ActivityDataModelMapper.ensureInitialized()
        .encodeJson<ActivityDataModel>(this as ActivityDataModel);
  }

  Map<String, dynamic> toMap() {
    return ActivityDataModelMapper.ensureInitialized()
        .encodeMap<ActivityDataModel>(this as ActivityDataModel);
  }

  ActivityDataModelCopyWith<ActivityDataModel, ActivityDataModel,
          ActivityDataModel>
      get copyWith =>
          _ActivityDataModelCopyWithImpl<ActivityDataModel, ActivityDataModel>(
              this as ActivityDataModel, $identity, $identity);
  @override
  String toString() {
    return ActivityDataModelMapper.ensureInitialized()
        .stringifyValue(this as ActivityDataModel);
  }

  @override
  bool operator ==(Object other) {
    return ActivityDataModelMapper.ensureInitialized()
        .equalsValue(this as ActivityDataModel, other);
  }

  @override
  int get hashCode {
    return ActivityDataModelMapper.ensureInitialized()
        .hashValue(this as ActivityDataModel);
  }
}

extension ActivityDataModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ActivityDataModel, $Out> {
  ActivityDataModelCopyWith<$R, ActivityDataModel, $Out>
      get $asActivityDataModel => $base
          .as((v, t, t2) => _ActivityDataModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ActivityDataModelCopyWith<$R, $In extends ActivityDataModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, ActivityItemModel,
          ActivityItemModelCopyWith<$R, ActivityItemModel, ActivityItemModel>>?
      get items;
  $R call({List<ActivityItemModel>? items, int? total, int? size});
  ActivityDataModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ActivityDataModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ActivityDataModel, $Out>
    implements ActivityDataModelCopyWith<$R, ActivityDataModel, $Out> {
  _ActivityDataModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ActivityDataModel> $mapper =
      ActivityDataModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, ActivityItemModel,
          ActivityItemModelCopyWith<$R, ActivityItemModel, ActivityItemModel>>?
      get items => $value.items != null
          ? ListCopyWith($value.items!, (v, t) => v.copyWith.$chain(t),
              (v) => call(items: v))
          : null;
  @override
  $R call({Object? items = $none, int? total, int? size}) =>
      $apply(FieldCopyWithData({
        if (items != $none) #items: items,
        if (total != null) #total: total,
        if (size != null) #size: size
      }));
  @override
  ActivityDataModel $make(CopyWithData data) => ActivityDataModel(
      items: data.get(#items, or: $value.items),
      total: data.get(#total, or: $value.total),
      size: data.get(#size, or: $value.size));

  @override
  ActivityDataModelCopyWith<$R2, ActivityDataModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ActivityDataModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
