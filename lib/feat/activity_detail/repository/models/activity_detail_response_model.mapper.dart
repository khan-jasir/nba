// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'activity_detail_response_model.dart';

class ActivityDetailResponseModelMapper
    extends ClassMapperBase<ActivityDetailResponseModel> {
  ActivityDetailResponseModelMapper._();

  static ActivityDetailResponseModelMapper? _instance;
  static ActivityDetailResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ActivityDetailResponseModelMapper._());
      ActivityDetailItemModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ActivityDetailResponseModel';

  static bool _$success(ActivityDetailResponseModel v) => v.success;
  static const Field<ActivityDetailResponseModel, bool> _f$success =
      Field('success', _$success);
  static String _$message(ActivityDetailResponseModel v) => v.message;
  static const Field<ActivityDetailResponseModel, String> _f$message =
      Field('message', _$message);
  static ActivityDetailItemModel? _$data(ActivityDetailResponseModel v) =>
      v.data;
  static const Field<ActivityDetailResponseModel, ActivityDetailItemModel>
      _f$data = Field('data', _$data, opt: true);

  @override
  final MappableFields<ActivityDetailResponseModel> fields = const {
    #success: _f$success,
    #message: _f$message,
    #data: _f$data,
  };

  static ActivityDetailResponseModel _instantiate(DecodingData data) {
    return ActivityDetailResponseModel(
        success: data.dec(_f$success),
        message: data.dec(_f$message),
        data: data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static ActivityDetailResponseModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ActivityDetailResponseModel>(map);
  }

  static ActivityDetailResponseModel fromJson(String json) {
    return ensureInitialized().decodeJson<ActivityDetailResponseModel>(json);
  }
}

mixin ActivityDetailResponseModelMappable {
  String toJson() {
    return ActivityDetailResponseModelMapper.ensureInitialized()
        .encodeJson<ActivityDetailResponseModel>(
            this as ActivityDetailResponseModel);
  }

  Map<String, dynamic> toMap() {
    return ActivityDetailResponseModelMapper.ensureInitialized()
        .encodeMap<ActivityDetailResponseModel>(
            this as ActivityDetailResponseModel);
  }

  ActivityDetailResponseModelCopyWith<ActivityDetailResponseModel,
          ActivityDetailResponseModel, ActivityDetailResponseModel>
      get copyWith => _ActivityDetailResponseModelCopyWithImpl<
              ActivityDetailResponseModel, ActivityDetailResponseModel>(
          this as ActivityDetailResponseModel, $identity, $identity);
  @override
  String toString() {
    return ActivityDetailResponseModelMapper.ensureInitialized()
        .stringifyValue(this as ActivityDetailResponseModel);
  }

  @override
  bool operator ==(Object other) {
    return ActivityDetailResponseModelMapper.ensureInitialized()
        .equalsValue(this as ActivityDetailResponseModel, other);
  }

  @override
  int get hashCode {
    return ActivityDetailResponseModelMapper.ensureInitialized()
        .hashValue(this as ActivityDetailResponseModel);
  }
}

extension ActivityDetailResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ActivityDetailResponseModel, $Out> {
  ActivityDetailResponseModelCopyWith<$R, ActivityDetailResponseModel, $Out>
      get $asActivityDetailResponseModel => $base.as((v, t, t2) =>
          _ActivityDetailResponseModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ActivityDetailResponseModelCopyWith<
    $R,
    $In extends ActivityDetailResponseModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ActivityDetailItemModelCopyWith<$R, ActivityDetailItemModel,
      ActivityDetailItemModel>? get data;
  $R call({bool? success, String? message, ActivityDetailItemModel? data});
  ActivityDetailResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ActivityDetailResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ActivityDetailResponseModel, $Out>
    implements
        ActivityDetailResponseModelCopyWith<$R, ActivityDetailResponseModel,
            $Out> {
  _ActivityDetailResponseModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ActivityDetailResponseModel> $mapper =
      ActivityDetailResponseModelMapper.ensureInitialized();
  @override
  ActivityDetailItemModelCopyWith<$R, ActivityDetailItemModel,
          ActivityDetailItemModel>?
      get data => $value.data?.copyWith.$chain((v) => call(data: v));
  @override
  $R call({bool? success, String? message, Object? data = $none}) =>
      $apply(FieldCopyWithData({
        if (success != null) #success: success,
        if (message != null) #message: message,
        if (data != $none) #data: data
      }));
  @override
  ActivityDetailResponseModel $make(CopyWithData data) =>
      ActivityDetailResponseModel(
          success: data.get(#success, or: $value.success),
          message: data.get(#message, or: $value.message),
          data: data.get(#data, or: $value.data));

  @override
  ActivityDetailResponseModelCopyWith<$R2, ActivityDetailResponseModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ActivityDetailResponseModelCopyWithImpl<$R2, $Out2>(
              $value, $cast, t);
}
