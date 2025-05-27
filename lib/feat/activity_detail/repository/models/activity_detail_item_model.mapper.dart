// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'activity_detail_item_model.dart';

class ActivityDetailItemModelMapper
    extends ClassMapperBase<ActivityDetailItemModel> {
  ActivityDetailItemModelMapper._();

  static ActivityDetailItemModelMapper? _instance;
  static ActivityDetailItemModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ActivityDetailItemModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ActivityDetailItemModel';

  static String? _$customerId(ActivityDetailItemModel v) => v.customerId;
  static const Field<ActivityDetailItemModel, String> _f$customerId =
      Field('customerId', _$customerId, opt: true);
  static String? _$referredBy(ActivityDetailItemModel v) => v.referredBy;
  static const Field<ActivityDetailItemModel, String> _f$referredBy =
      Field('referredBy', _$referredBy, opt: true);
  static String? _$title(ActivityDetailItemModel v) => v.title;
  static const Field<ActivityDetailItemModel, String> _f$title =
      Field('title', _$title, opt: true);
  static String? _$fullName(ActivityDetailItemModel v) => v.fullName;
  static const Field<ActivityDetailItemModel, String> _f$fullName =
      Field('fullName', _$fullName, opt: true);
  static String? _$emailId(ActivityDetailItemModel v) => v.emailId;
  static const Field<ActivityDetailItemModel, String> _f$emailId =
      Field('emailId', _$emailId, opt: true);
  static String? _$countryCode(ActivityDetailItemModel v) => v.countryCode;
  static const Field<ActivityDetailItemModel, String> _f$countryCode =
      Field('countryCode', _$countryCode, opt: true);
  static String? _$mobileNumber(ActivityDetailItemModel v) => v.mobileNumber;
  static const Field<ActivityDetailItemModel, String> _f$mobileNumber =
      Field('mobileNumber', _$mobileNumber, opt: true);
  static bool? _$status(ActivityDetailItemModel v) => v.status;
  static const Field<ActivityDetailItemModel, bool> _f$status =
      Field('status', _$status, opt: true);
  static String? _$dob(ActivityDetailItemModel v) => v.dob;
  static const Field<ActivityDetailItemModel, String> _f$dob =
      Field('dob', _$dob, opt: true);
  static String? _$gender(ActivityDetailItemModel v) => v.gender;
  static const Field<ActivityDetailItemModel, String> _f$gender =
      Field('gender', _$gender, opt: true);
  static String? _$lob(ActivityDetailItemModel v) => v.lob;
  static const Field<ActivityDetailItemModel, String> _f$lob =
      Field('lob', _$lob, opt: true);
  static String? _$taskName(ActivityDetailItemModel v) => v.taskName;
  static const Field<ActivityDetailItemModel, String> _f$taskName =
      Field('taskName', _$taskName, opt: true);
  static String? _$taskDescription(ActivityDetailItemModel v) =>
      v.taskDescription;
  static const Field<ActivityDetailItemModel, String> _f$taskDescription =
      Field('taskDescription', _$taskDescription, opt: true);
  static String? _$startDate(ActivityDetailItemModel v) => v.startDate;
  static const Field<ActivityDetailItemModel, String> _f$startDate =
      Field('startDate', _$startDate, opt: true);
  static String? _$endDate(ActivityDetailItemModel v) => v.endDate;
  static const Field<ActivityDetailItemModel, String> _f$endDate =
      Field('endDate', _$endDate, opt: true);

  @override
  final MappableFields<ActivityDetailItemModel> fields = const {
    #customerId: _f$customerId,
    #referredBy: _f$referredBy,
    #title: _f$title,
    #fullName: _f$fullName,
    #emailId: _f$emailId,
    #countryCode: _f$countryCode,
    #mobileNumber: _f$mobileNumber,
    #status: _f$status,
    #dob: _f$dob,
    #gender: _f$gender,
    #lob: _f$lob,
    #taskName: _f$taskName,
    #taskDescription: _f$taskDescription,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
  };

  static ActivityDetailItemModel _instantiate(DecodingData data) {
    return ActivityDetailItemModel(
        customerId: data.dec(_f$customerId),
        referredBy: data.dec(_f$referredBy),
        title: data.dec(_f$title),
        fullName: data.dec(_f$fullName),
        emailId: data.dec(_f$emailId),
        countryCode: data.dec(_f$countryCode),
        mobileNumber: data.dec(_f$mobileNumber),
        status: data.dec(_f$status),
        dob: data.dec(_f$dob),
        gender: data.dec(_f$gender),
        lob: data.dec(_f$lob),
        taskName: data.dec(_f$taskName),
        taskDescription: data.dec(_f$taskDescription),
        startDate: data.dec(_f$startDate),
        endDate: data.dec(_f$endDate));
  }

  @override
  final Function instantiate = _instantiate;

  static ActivityDetailItemModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ActivityDetailItemModel>(map);
  }

  static ActivityDetailItemModel fromJson(String json) {
    return ensureInitialized().decodeJson<ActivityDetailItemModel>(json);
  }
}

mixin ActivityDetailItemModelMappable {
  String toJson() {
    return ActivityDetailItemModelMapper.ensureInitialized()
        .encodeJson<ActivityDetailItemModel>(this as ActivityDetailItemModel);
  }

  Map<String, dynamic> toMap() {
    return ActivityDetailItemModelMapper.ensureInitialized()
        .encodeMap<ActivityDetailItemModel>(this as ActivityDetailItemModel);
  }

  ActivityDetailItemModelCopyWith<ActivityDetailItemModel,
          ActivityDetailItemModel, ActivityDetailItemModel>
      get copyWith => _ActivityDetailItemModelCopyWithImpl<
              ActivityDetailItemModel, ActivityDetailItemModel>(
          this as ActivityDetailItemModel, $identity, $identity);
  @override
  String toString() {
    return ActivityDetailItemModelMapper.ensureInitialized()
        .stringifyValue(this as ActivityDetailItemModel);
  }

  @override
  bool operator ==(Object other) {
    return ActivityDetailItemModelMapper.ensureInitialized()
        .equalsValue(this as ActivityDetailItemModel, other);
  }

  @override
  int get hashCode {
    return ActivityDetailItemModelMapper.ensureInitialized()
        .hashValue(this as ActivityDetailItemModel);
  }
}

extension ActivityDetailItemModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ActivityDetailItemModel, $Out> {
  ActivityDetailItemModelCopyWith<$R, ActivityDetailItemModel, $Out>
      get $asActivityDetailItemModel => $base.as((v, t, t2) =>
          _ActivityDetailItemModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ActivityDetailItemModelCopyWith<
    $R,
    $In extends ActivityDetailItemModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? customerId,
      String? referredBy,
      String? title,
      String? fullName,
      String? emailId,
      String? countryCode,
      String? mobileNumber,
      bool? status,
      String? dob,
      String? gender,
      String? lob,
      String? taskName,
      String? taskDescription,
      String? startDate,
      String? endDate});
  ActivityDetailItemModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ActivityDetailItemModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ActivityDetailItemModel, $Out>
    implements
        ActivityDetailItemModelCopyWith<$R, ActivityDetailItemModel, $Out> {
  _ActivityDetailItemModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ActivityDetailItemModel> $mapper =
      ActivityDetailItemModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? customerId = $none,
          Object? referredBy = $none,
          Object? title = $none,
          Object? fullName = $none,
          Object? emailId = $none,
          Object? countryCode = $none,
          Object? mobileNumber = $none,
          Object? status = $none,
          Object? dob = $none,
          Object? gender = $none,
          Object? lob = $none,
          Object? taskName = $none,
          Object? taskDescription = $none,
          Object? startDate = $none,
          Object? endDate = $none}) =>
      $apply(FieldCopyWithData({
        if (customerId != $none) #customerId: customerId,
        if (referredBy != $none) #referredBy: referredBy,
        if (title != $none) #title: title,
        if (fullName != $none) #fullName: fullName,
        if (emailId != $none) #emailId: emailId,
        if (countryCode != $none) #countryCode: countryCode,
        if (mobileNumber != $none) #mobileNumber: mobileNumber,
        if (status != $none) #status: status,
        if (dob != $none) #dob: dob,
        if (gender != $none) #gender: gender,
        if (lob != $none) #lob: lob,
        if (taskName != $none) #taskName: taskName,
        if (taskDescription != $none) #taskDescription: taskDescription,
        if (startDate != $none) #startDate: startDate,
        if (endDate != $none) #endDate: endDate
      }));
  @override
  ActivityDetailItemModel $make(CopyWithData data) => ActivityDetailItemModel(
      customerId: data.get(#customerId, or: $value.customerId),
      referredBy: data.get(#referredBy, or: $value.referredBy),
      title: data.get(#title, or: $value.title),
      fullName: data.get(#fullName, or: $value.fullName),
      emailId: data.get(#emailId, or: $value.emailId),
      countryCode: data.get(#countryCode, or: $value.countryCode),
      mobileNumber: data.get(#mobileNumber, or: $value.mobileNumber),
      status: data.get(#status, or: $value.status),
      dob: data.get(#dob, or: $value.dob),
      gender: data.get(#gender, or: $value.gender),
      lob: data.get(#lob, or: $value.lob),
      taskName: data.get(#taskName, or: $value.taskName),
      taskDescription: data.get(#taskDescription, or: $value.taskDescription),
      startDate: data.get(#startDate, or: $value.startDate),
      endDate: data.get(#endDate, or: $value.endDate));

  @override
  ActivityDetailItemModelCopyWith<$R2, ActivityDetailItemModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ActivityDetailItemModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
