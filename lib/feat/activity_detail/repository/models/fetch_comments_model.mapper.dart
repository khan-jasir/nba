// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'fetch_comments_model.dart';

class FetchCommentsModelMapper extends ClassMapperBase<FetchCommentsModel> {
  FetchCommentsModelMapper._();

  static FetchCommentsModelMapper? _instance;
  static FetchCommentsModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FetchCommentsModelMapper._());
      CommentsModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FetchCommentsModel';

  static bool _$success(FetchCommentsModel v) => v.success;
  static const Field<FetchCommentsModel, bool> _f$success =
      Field('success', _$success);
  static String _$message(FetchCommentsModel v) => v.message;
  static const Field<FetchCommentsModel, String> _f$message =
      Field('message', _$message);
  static CommentsModel? _$data(FetchCommentsModel v) => v.data;
  static const Field<FetchCommentsModel, CommentsModel> _f$data =
      Field('data', _$data, opt: true);

  @override
  final MappableFields<FetchCommentsModel> fields = const {
    #success: _f$success,
    #message: _f$message,
    #data: _f$data,
  };

  static FetchCommentsModel _instantiate(DecodingData data) {
    return FetchCommentsModel(
        success: data.dec(_f$success),
        message: data.dec(_f$message),
        data: data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static FetchCommentsModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FetchCommentsModel>(map);
  }

  static FetchCommentsModel fromJson(String json) {
    return ensureInitialized().decodeJson<FetchCommentsModel>(json);
  }
}

mixin FetchCommentsModelMappable {
  String toJson() {
    return FetchCommentsModelMapper.ensureInitialized()
        .encodeJson<FetchCommentsModel>(this as FetchCommentsModel);
  }

  Map<String, dynamic> toMap() {
    return FetchCommentsModelMapper.ensureInitialized()
        .encodeMap<FetchCommentsModel>(this as FetchCommentsModel);
  }

  FetchCommentsModelCopyWith<FetchCommentsModel, FetchCommentsModel,
          FetchCommentsModel>
      get copyWith => _FetchCommentsModelCopyWithImpl<FetchCommentsModel,
          FetchCommentsModel>(this as FetchCommentsModel, $identity, $identity);
  @override
  String toString() {
    return FetchCommentsModelMapper.ensureInitialized()
        .stringifyValue(this as FetchCommentsModel);
  }

  @override
  bool operator ==(Object other) {
    return FetchCommentsModelMapper.ensureInitialized()
        .equalsValue(this as FetchCommentsModel, other);
  }

  @override
  int get hashCode {
    return FetchCommentsModelMapper.ensureInitialized()
        .hashValue(this as FetchCommentsModel);
  }
}

extension FetchCommentsModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FetchCommentsModel, $Out> {
  FetchCommentsModelCopyWith<$R, FetchCommentsModel, $Out>
      get $asFetchCommentsModel => $base.as(
          (v, t, t2) => _FetchCommentsModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FetchCommentsModelCopyWith<$R, $In extends FetchCommentsModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  CommentsModelCopyWith<$R, CommentsModel, CommentsModel>? get data;
  $R call({bool? success, String? message, CommentsModel? data});
  FetchCommentsModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FetchCommentsModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FetchCommentsModel, $Out>
    implements FetchCommentsModelCopyWith<$R, FetchCommentsModel, $Out> {
  _FetchCommentsModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FetchCommentsModel> $mapper =
      FetchCommentsModelMapper.ensureInitialized();
  @override
  CommentsModelCopyWith<$R, CommentsModel, CommentsModel>? get data =>
      $value.data?.copyWith.$chain((v) => call(data: v));
  @override
  $R call({bool? success, String? message, Object? data = $none}) =>
      $apply(FieldCopyWithData({
        if (success != null) #success: success,
        if (message != null) #message: message,
        if (data != $none) #data: data
      }));
  @override
  FetchCommentsModel $make(CopyWithData data) => FetchCommentsModel(
      success: data.get(#success, or: $value.success),
      message: data.get(#message, or: $value.message),
      data: data.get(#data, or: $value.data));

  @override
  FetchCommentsModelCopyWith<$R2, FetchCommentsModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FetchCommentsModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
