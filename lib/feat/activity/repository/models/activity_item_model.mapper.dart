// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'activity_item_model.dart';

class ActivityItemModelMapper extends ClassMapperBase<ActivityItemModel> {
  ActivityItemModelMapper._();

  static ActivityItemModelMapper? _instance;
  static ActivityItemModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ActivityItemModelMapper._());
      ActivityDetailsDataModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ActivityItemModel';

  static String _$id(ActivityItemModel v) => v.id;
  static const Field<ActivityItemModel, String> _f$id = Field('id', _$id);
  static String _$taskName(ActivityItemModel v) => v.taskName;
  static const Field<ActivityItemModel, String> _f$taskName =
      Field('taskName', _$taskName);
  static String _$taskDescription(ActivityItemModel v) => v.taskDescription;
  static const Field<ActivityItemModel, String> _f$taskDescription =
      Field('taskDescription', _$taskDescription);
  static String? _$startDate(ActivityItemModel v) => v.startDate;
  static const Field<ActivityItemModel, String> _f$startDate =
      Field('startDate', _$startDate, opt: true);
  static String? _$endDate(ActivityItemModel v) => v.endDate;
  static const Field<ActivityItemModel, String> _f$endDate =
      Field('endDate', _$endDate, opt: true);
  static String? _$dueDate(ActivityItemModel v) => v.dueDate;
  static const Field<ActivityItemModel, String> _f$dueDate =
      Field('dueDate', _$dueDate, opt: true);
  static String? _$priorityLevel(ActivityItemModel v) => v.priorityLevel;
  static const Field<ActivityItemModel, String> _f$priorityLevel =
      Field('priorityLevel', _$priorityLevel, opt: true);
  static String? _$priorityOrder(ActivityItemModel v) => v.priorityOrder;
  static const Field<ActivityItemModel, String> _f$priorityOrder =
      Field('priorityOrder', _$priorityOrder, opt: true);
  static String? _$taskSourceId(ActivityItemModel v) => v.taskSourceId;
  static const Field<ActivityItemModel, String> _f$taskSourceId =
      Field('taskSourceId', _$taskSourceId, opt: true);
  static String? _$finalStatus(ActivityItemModel v) => v.finalStatus;
  static const Field<ActivityItemModel, String> _f$finalStatus =
      Field('finalStatus', _$finalStatus, opt: true);
  static String? _$lob(ActivityItemModel v) => v.lob;
  static const Field<ActivityItemModel, String> _f$lob =
      Field('lob', _$lob, opt: true);
  static ActivityDetailsDataModel? _$details(ActivityItemModel v) => v.details;
  static const Field<ActivityItemModel, ActivityDetailsDataModel> _f$details =
      Field('details', _$details, opt: true);
  static String? _$completedOn(ActivityItemModel v) => v.completedOn;
  static const Field<ActivityItemModel, String> _f$completedOn =
      Field('completedOn', _$completedOn, opt: true);
  static String? _$oldPriority(ActivityItemModel v) => v.oldPriority;
  static const Field<ActivityItemModel, String> _f$oldPriority =
      Field('oldPriority', _$oldPriority, opt: true);
  static String? _$oldStatus(ActivityItemModel v) => v.oldStatus;
  static const Field<ActivityItemModel, String> _f$oldStatus =
      Field('oldStatus', _$oldStatus, opt: true);
  static String? _$currentStatus(ActivityItemModel v) => v.currentStatus;
  static const Field<ActivityItemModel, String> _f$currentStatus =
      Field('currentStatus', _$currentStatus, opt: true);
  static String? _$taskCreatedAt(ActivityItemModel v) => v.taskCreatedAt;
  static const Field<ActivityItemModel, String> _f$taskCreatedAt =
      Field('taskCreatedAt', _$taskCreatedAt, opt: true);

  @override
  final MappableFields<ActivityItemModel> fields = const {
    #id: _f$id,
    #taskName: _f$taskName,
    #taskDescription: _f$taskDescription,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
    #dueDate: _f$dueDate,
    #priorityLevel: _f$priorityLevel,
    #priorityOrder: _f$priorityOrder,
    #taskSourceId: _f$taskSourceId,
    #finalStatus: _f$finalStatus,
    #lob: _f$lob,
    #details: _f$details,
    #completedOn: _f$completedOn,
    #oldPriority: _f$oldPriority,
    #oldStatus: _f$oldStatus,
    #currentStatus: _f$currentStatus,
    #taskCreatedAt: _f$taskCreatedAt,
  };

  static ActivityItemModel _instantiate(DecodingData data) {
    return ActivityItemModel(
        id: data.dec(_f$id),
        taskName: data.dec(_f$taskName),
        taskDescription: data.dec(_f$taskDescription),
        startDate: data.dec(_f$startDate),
        endDate: data.dec(_f$endDate),
        dueDate: data.dec(_f$dueDate),
        priorityLevel: data.dec(_f$priorityLevel),
        priorityOrder: data.dec(_f$priorityOrder),
        taskSourceId: data.dec(_f$taskSourceId),
        finalStatus: data.dec(_f$finalStatus),
        lob: data.dec(_f$lob),
        details: data.dec(_f$details),
        completedOn: data.dec(_f$completedOn),
        oldPriority: data.dec(_f$oldPriority),
        oldStatus: data.dec(_f$oldStatus),
        currentStatus: data.dec(_f$currentStatus),
        taskCreatedAt: data.dec(_f$taskCreatedAt));
  }

  @override
  final Function instantiate = _instantiate;

  static ActivityItemModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ActivityItemModel>(map);
  }

  static ActivityItemModel fromJson(String json) {
    return ensureInitialized().decodeJson<ActivityItemModel>(json);
  }
}

mixin ActivityItemModelMappable {
  String toJson() {
    return ActivityItemModelMapper.ensureInitialized()
        .encodeJson<ActivityItemModel>(this as ActivityItemModel);
  }

  Map<String, dynamic> toMap() {
    return ActivityItemModelMapper.ensureInitialized()
        .encodeMap<ActivityItemModel>(this as ActivityItemModel);
  }

  ActivityItemModelCopyWith<ActivityItemModel, ActivityItemModel,
          ActivityItemModel>
      get copyWith =>
          _ActivityItemModelCopyWithImpl<ActivityItemModel, ActivityItemModel>(
              this as ActivityItemModel, $identity, $identity);
  @override
  String toString() {
    return ActivityItemModelMapper.ensureInitialized()
        .stringifyValue(this as ActivityItemModel);
  }

  @override
  bool operator ==(Object other) {
    return ActivityItemModelMapper.ensureInitialized()
        .equalsValue(this as ActivityItemModel, other);
  }

  @override
  int get hashCode {
    return ActivityItemModelMapper.ensureInitialized()
        .hashValue(this as ActivityItemModel);
  }
}

extension ActivityItemModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ActivityItemModel, $Out> {
  ActivityItemModelCopyWith<$R, ActivityItemModel, $Out>
      get $asActivityItemModel => $base
          .as((v, t, t2) => _ActivityItemModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ActivityItemModelCopyWith<$R, $In extends ActivityItemModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ActivityDetailsDataModelCopyWith<$R, ActivityDetailsDataModel,
      ActivityDetailsDataModel>? get details;
  $R call(
      {String? id,
      String? taskName,
      String? taskDescription,
      String? startDate,
      String? endDate,
      String? dueDate,
      String? priorityLevel,
      String? priorityOrder,
      String? taskSourceId,
      String? finalStatus,
      String? lob,
      ActivityDetailsDataModel? details,
      String? completedOn,
      String? oldPriority,
      String? oldStatus,
      String? currentStatus,
      String? taskCreatedAt});
  ActivityItemModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ActivityItemModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ActivityItemModel, $Out>
    implements ActivityItemModelCopyWith<$R, ActivityItemModel, $Out> {
  _ActivityItemModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ActivityItemModel> $mapper =
      ActivityItemModelMapper.ensureInitialized();
  @override
  ActivityDetailsDataModelCopyWith<$R, ActivityDetailsDataModel,
          ActivityDetailsDataModel>?
      get details => $value.details?.copyWith.$chain((v) => call(details: v));
  @override
  $R call(
          {String? id,
          String? taskName,
          String? taskDescription,
          Object? startDate = $none,
          Object? endDate = $none,
          Object? dueDate = $none,
          Object? priorityLevel = $none,
          Object? priorityOrder = $none,
          Object? taskSourceId = $none,
          Object? finalStatus = $none,
          Object? lob = $none,
          Object? details = $none,
          Object? completedOn = $none,
          Object? oldPriority = $none,
          Object? oldStatus = $none,
          Object? currentStatus = $none,
          Object? taskCreatedAt = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (taskName != null) #taskName: taskName,
        if (taskDescription != null) #taskDescription: taskDescription,
        if (startDate != $none) #startDate: startDate,
        if (endDate != $none) #endDate: endDate,
        if (dueDate != $none) #dueDate: dueDate,
        if (priorityLevel != $none) #priorityLevel: priorityLevel,
        if (priorityOrder != $none) #priorityOrder: priorityOrder,
        if (taskSourceId != $none) #taskSourceId: taskSourceId,
        if (finalStatus != $none) #finalStatus: finalStatus,
        if (lob != $none) #lob: lob,
        if (details != $none) #details: details,
        if (completedOn != $none) #completedOn: completedOn,
        if (oldPriority != $none) #oldPriority: oldPriority,
        if (oldStatus != $none) #oldStatus: oldStatus,
        if (currentStatus != $none) #currentStatus: currentStatus,
        if (taskCreatedAt != $none) #taskCreatedAt: taskCreatedAt
      }));
  @override
  ActivityItemModel $make(CopyWithData data) => ActivityItemModel(
      id: data.get(#id, or: $value.id),
      taskName: data.get(#taskName, or: $value.taskName),
      taskDescription: data.get(#taskDescription, or: $value.taskDescription),
      startDate: data.get(#startDate, or: $value.startDate),
      endDate: data.get(#endDate, or: $value.endDate),
      dueDate: data.get(#dueDate, or: $value.dueDate),
      priorityLevel: data.get(#priorityLevel, or: $value.priorityLevel),
      priorityOrder: data.get(#priorityOrder, or: $value.priorityOrder),
      taskSourceId: data.get(#taskSourceId, or: $value.taskSourceId),
      finalStatus: data.get(#finalStatus, or: $value.finalStatus),
      lob: data.get(#lob, or: $value.lob),
      details: data.get(#details, or: $value.details),
      completedOn: data.get(#completedOn, or: $value.completedOn),
      oldPriority: data.get(#oldPriority, or: $value.oldPriority),
      oldStatus: data.get(#oldStatus, or: $value.oldStatus),
      currentStatus: data.get(#currentStatus, or: $value.currentStatus),
      taskCreatedAt: data.get(#taskCreatedAt, or: $value.taskCreatedAt));

  @override
  ActivityItemModelCopyWith<$R2, ActivityItemModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ActivityItemModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
