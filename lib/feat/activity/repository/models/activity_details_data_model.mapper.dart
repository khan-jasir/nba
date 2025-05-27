// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'activity_details_data_model.dart';

class ActivityDetailsDataModelMapper
    extends ClassMapperBase<ActivityDetailsDataModel> {
  ActivityDetailsDataModelMapper._();

  static ActivityDetailsDataModelMapper? _instance;
  static ActivityDetailsDataModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ActivityDetailsDataModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ActivityDetailsDataModel';

  static String? _$customerId(ActivityDetailsDataModel v) => v.customerId;
  static const Field<ActivityDetailsDataModel, String> _f$customerId =
      Field('customerId', _$customerId, opt: true);
  static String? _$fullName(ActivityDetailsDataModel v) => v.fullName;
  static const Field<ActivityDetailsDataModel, String> _f$fullName =
      Field('fullName', _$fullName, opt: true);
  static String? _$gender(ActivityDetailsDataModel v) => v.gender;
  static const Field<ActivityDetailsDataModel, String> _f$gender =
      Field('gender', _$gender, opt: true);
  static String? _$dob(ActivityDetailsDataModel v) => v.dob;
  static const Field<ActivityDetailsDataModel, String> _f$dob =
      Field('dob', _$dob, opt: true);
  static String? _$emailId(ActivityDetailsDataModel v) => v.emailId;
  static const Field<ActivityDetailsDataModel, String> _f$emailId =
      Field('emailId', _$emailId, opt: true);
  static String? _$countryCode(ActivityDetailsDataModel v) => v.countryCode;
  static const Field<ActivityDetailsDataModel, String> _f$countryCode =
      Field('countryCode', _$countryCode, opt: true);
  static String? _$mobileNo(ActivityDetailsDataModel v) => v.mobileNo;
  static const Field<ActivityDetailsDataModel, String> _f$mobileNo =
      Field('mobileNo', _$mobileNo, opt: true);

  @override
  final MappableFields<ActivityDetailsDataModel> fields = const {
    #customerId: _f$customerId,
    #fullName: _f$fullName,
    #gender: _f$gender,
    #dob: _f$dob,
    #emailId: _f$emailId,
    #countryCode: _f$countryCode,
    #mobileNo: _f$mobileNo,
  };

  static ActivityDetailsDataModel _instantiate(DecodingData data) {
    return ActivityDetailsDataModel(
        customerId: data.dec(_f$customerId),
        fullName: data.dec(_f$fullName),
        gender: data.dec(_f$gender),
        dob: data.dec(_f$dob),
        emailId: data.dec(_f$emailId),
        countryCode: data.dec(_f$countryCode),
        mobileNo: data.dec(_f$mobileNo));
  }

  @override
  final Function instantiate = _instantiate;

  static ActivityDetailsDataModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ActivityDetailsDataModel>(map);
  }

  static ActivityDetailsDataModel fromJson(String json) {
    return ensureInitialized().decodeJson<ActivityDetailsDataModel>(json);
  }
}

mixin ActivityDetailsDataModelMappable {
  String toJson() {
    return ActivityDetailsDataModelMapper.ensureInitialized()
        .encodeJson<ActivityDetailsDataModel>(this as ActivityDetailsDataModel);
  }

  Map<String, dynamic> toMap() {
    return ActivityDetailsDataModelMapper.ensureInitialized()
        .encodeMap<ActivityDetailsDataModel>(this as ActivityDetailsDataModel);
  }

  ActivityDetailsDataModelCopyWith<ActivityDetailsDataModel,
          ActivityDetailsDataModel, ActivityDetailsDataModel>
      get copyWith => _ActivityDetailsDataModelCopyWithImpl<
              ActivityDetailsDataModel, ActivityDetailsDataModel>(
          this as ActivityDetailsDataModel, $identity, $identity);
  @override
  String toString() {
    return ActivityDetailsDataModelMapper.ensureInitialized()
        .stringifyValue(this as ActivityDetailsDataModel);
  }

  @override
  bool operator ==(Object other) {
    return ActivityDetailsDataModelMapper.ensureInitialized()
        .equalsValue(this as ActivityDetailsDataModel, other);
  }

  @override
  int get hashCode {
    return ActivityDetailsDataModelMapper.ensureInitialized()
        .hashValue(this as ActivityDetailsDataModel);
  }
}

extension ActivityDetailsDataModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ActivityDetailsDataModel, $Out> {
  ActivityDetailsDataModelCopyWith<$R, ActivityDetailsDataModel, $Out>
      get $asActivityDetailsDataModel => $base.as((v, t, t2) =>
          _ActivityDetailsDataModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ActivityDetailsDataModelCopyWith<
    $R,
    $In extends ActivityDetailsDataModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? customerId,
      String? fullName,
      String? gender,
      String? dob,
      String? emailId,
      String? countryCode,
      String? mobileNo});
  ActivityDetailsDataModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ActivityDetailsDataModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ActivityDetailsDataModel, $Out>
    implements
        ActivityDetailsDataModelCopyWith<$R, ActivityDetailsDataModel, $Out> {
  _ActivityDetailsDataModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ActivityDetailsDataModel> $mapper =
      ActivityDetailsDataModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? customerId = $none,
          Object? fullName = $none,
          Object? gender = $none,
          Object? dob = $none,
          Object? emailId = $none,
          Object? countryCode = $none,
          Object? mobileNo = $none}) =>
      $apply(FieldCopyWithData({
        if (customerId != $none) #customerId: customerId,
        if (fullName != $none) #fullName: fullName,
        if (gender != $none) #gender: gender,
        if (dob != $none) #dob: dob,
        if (emailId != $none) #emailId: emailId,
        if (countryCode != $none) #countryCode: countryCode,
        if (mobileNo != $none) #mobileNo: mobileNo
      }));
  @override
  ActivityDetailsDataModel $make(CopyWithData data) => ActivityDetailsDataModel(
      customerId: data.get(#customerId, or: $value.customerId),
      fullName: data.get(#fullName, or: $value.fullName),
      gender: data.get(#gender, or: $value.gender),
      dob: data.get(#dob, or: $value.dob),
      emailId: data.get(#emailId, or: $value.emailId),
      countryCode: data.get(#countryCode, or: $value.countryCode),
      mobileNo: data.get(#mobileNo, or: $value.mobileNo));

  @override
  ActivityDetailsDataModelCopyWith<$R2, ActivityDetailsDataModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ActivityDetailsDataModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
