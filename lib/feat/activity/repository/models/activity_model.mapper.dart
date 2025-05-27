// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'activity_model.dart';

class ActivityModelMapper extends ClassMapperBase<ActivityModel> {
  ActivityModelMapper._();

  static ActivityModelMapper? _instance;
  static ActivityModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ActivityModelMapper._());
      ActivityDataModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ActivityModel';

  static bool _$success(ActivityModel v) => v.success;
  static const Field<ActivityModel, bool> _f$success =
      Field('success', _$success);
  static String _$message(ActivityModel v) => v.message;
  static const Field<ActivityModel, String> _f$message =
      Field('message', _$message);
  static ActivityDataModel _$data(ActivityModel v) => v.data;
  static const Field<ActivityModel, ActivityDataModel> _f$data =
      Field('data', _$data);

  @override
  final MappableFields<ActivityModel> fields = const {
    #success: _f$success,
    #message: _f$message,
    #data: _f$data,
  };

  static ActivityModel _instantiate(DecodingData data) {
    return ActivityModel(
        success: data.dec(_f$success),
        message: data.dec(_f$message),
        data: data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static ActivityModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ActivityModel>(map);
  }

  static ActivityModel fromJson(String json) {
    return ensureInitialized().decodeJson<ActivityModel>(json);
  }
}

mixin ActivityModelMappable {
  String toJson() {
    return ActivityModelMapper.ensureInitialized()
        .encodeJson<ActivityModel>(this as ActivityModel);
  }

  Map<String, dynamic> toMap() {
    return ActivityModelMapper.ensureInitialized()
        .encodeMap<ActivityModel>(this as ActivityModel);
  }

  ActivityModelCopyWith<ActivityModel, ActivityModel, ActivityModel>
      get copyWith => _ActivityModelCopyWithImpl<ActivityModel, ActivityModel>(
          this as ActivityModel, $identity, $identity);
  @override
  String toString() {
    return ActivityModelMapper.ensureInitialized()
        .stringifyValue(this as ActivityModel);
  }

  @override
  bool operator ==(Object other) {
    return ActivityModelMapper.ensureInitialized()
        .equalsValue(this as ActivityModel, other);
  }

  @override
  int get hashCode {
    return ActivityModelMapper.ensureInitialized()
        .hashValue(this as ActivityModel);
  }
}

extension ActivityModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ActivityModel, $Out> {
  ActivityModelCopyWith<$R, ActivityModel, $Out> get $asActivityModel =>
      $base.as((v, t, t2) => _ActivityModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ActivityModelCopyWith<$R, $In extends ActivityModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ActivityDataModelCopyWith<$R, ActivityDataModel, ActivityDataModel> get data;
  $R call({bool? success, String? message, ActivityDataModel? data});
  ActivityModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ActivityModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ActivityModel, $Out>
    implements ActivityModelCopyWith<$R, ActivityModel, $Out> {
  _ActivityModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ActivityModel> $mapper =
      ActivityModelMapper.ensureInitialized();
  @override
  ActivityDataModelCopyWith<$R, ActivityDataModel, ActivityDataModel>
      get data => $value.data.copyWith.$chain((v) => call(data: v));
  @override
  $R call({bool? success, String? message, ActivityDataModel? data}) =>
      $apply(FieldCopyWithData({
        if (success != null) #success: success,
        if (message != null) #message: message,
        if (data != null) #data: data
      }));
  @override
  ActivityModel $make(CopyWithData data) => ActivityModel(
      success: data.get(#success, or: $value.success),
      message: data.get(#message, or: $value.message),
      data: data.get(#data, or: $value.data));

  @override
  ActivityModelCopyWith<$R2, ActivityModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ActivityModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
