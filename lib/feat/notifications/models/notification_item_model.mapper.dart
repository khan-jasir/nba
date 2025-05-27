// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'notification_item_model.dart';

class NotificationItemModelMapper
    extends ClassMapperBase<NotificationItemModel> {
  NotificationItemModelMapper._();

  static NotificationItemModelMapper? _instance;
  static NotificationItemModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NotificationItemModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'NotificationItemModel';

  static String _$id(NotificationItemModel v) => v.id;
  static const Field<NotificationItemModel, String> _f$id = Field('id', _$id);
  static String _$title(NotificationItemModel v) => v.title;
  static const Field<NotificationItemModel, String> _f$title =
      Field('title', _$title);
  static String _$message(NotificationItemModel v) => v.message;
  static const Field<NotificationItemModel, String> _f$message =
      Field('message', _$message);
  static String _$status(NotificationItemModel v) => v.status;
  static const Field<NotificationItemModel, String> _f$status =
      Field('status', _$status);
  static String _$priorityLevel(NotificationItemModel v) => v.priorityLevel;
  static const Field<NotificationItemModel, String> _f$priorityLevel =
      Field('priorityLevel', _$priorityLevel);
  static Map<String, String> _$queryParams(NotificationItemModel v) =>
      v.queryParams;
  static const Field<NotificationItemModel, Map<String, String>>
      _f$queryParams = Field('queryParams', _$queryParams);
  static String _$agentId(NotificationItemModel v) => v.agentId;
  static const Field<NotificationItemModel, String> _f$agentId =
      Field('agentId', _$agentId);
  static String _$source(NotificationItemModel v) => v.source;
  static const Field<NotificationItemModel, String> _f$source =
      Field('source', _$source);
  static String _$sourceId(NotificationItemModel v) => v.sourceId;
  static const Field<NotificationItemModel, String> _f$sourceId =
      Field('sourceId', _$sourceId);
  static String? _$sentAt(NotificationItemModel v) => v.sentAt;
  static const Field<NotificationItemModel, String> _f$sentAt =
      Field('sentAt', _$sentAt, opt: true);
  static String? _$readAt(NotificationItemModel v) => v.readAt;
  static const Field<NotificationItemModel, String> _f$readAt =
      Field('readAt', _$readAt, opt: true);
  static String? _$dismissedAt(NotificationItemModel v) => v.dismissedAt;
  static const Field<NotificationItemModel, String> _f$dismissedAt =
      Field('dismissedAt', _$dismissedAt, opt: true);
  static String? _$label(NotificationItemModel v) => v.label;
  static const Field<NotificationItemModel, String> _f$label =
      Field('label', _$label, opt: true);

  @override
  final MappableFields<NotificationItemModel> fields = const {
    #id: _f$id,
    #title: _f$title,
    #message: _f$message,
    #status: _f$status,
    #priorityLevel: _f$priorityLevel,
    #queryParams: _f$queryParams,
    #agentId: _f$agentId,
    #source: _f$source,
    #sourceId: _f$sourceId,
    #sentAt: _f$sentAt,
    #readAt: _f$readAt,
    #dismissedAt: _f$dismissedAt,
    #label: _f$label,
  };

  static NotificationItemModel _instantiate(DecodingData data) {
    return NotificationItemModel(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        message: data.dec(_f$message),
        status: data.dec(_f$status),
        priorityLevel: data.dec(_f$priorityLevel),
        queryParams: data.dec(_f$queryParams),
        agentId: data.dec(_f$agentId),
        source: data.dec(_f$source),
        sourceId: data.dec(_f$sourceId),
        sentAt: data.dec(_f$sentAt),
        readAt: data.dec(_f$readAt),
        dismissedAt: data.dec(_f$dismissedAt),
        label: data.dec(_f$label));
  }

  @override
  final Function instantiate = _instantiate;

  static NotificationItemModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NotificationItemModel>(map);
  }

  static NotificationItemModel fromJson(String json) {
    return ensureInitialized().decodeJson<NotificationItemModel>(json);
  }
}

mixin NotificationItemModelMappable {
  String toJson() {
    return NotificationItemModelMapper.ensureInitialized()
        .encodeJson<NotificationItemModel>(this as NotificationItemModel);
  }

  Map<String, dynamic> toMap() {
    return NotificationItemModelMapper.ensureInitialized()
        .encodeMap<NotificationItemModel>(this as NotificationItemModel);
  }

  NotificationItemModelCopyWith<NotificationItemModel, NotificationItemModel,
      NotificationItemModel> get copyWith => _NotificationItemModelCopyWithImpl<
          NotificationItemModel, NotificationItemModel>(
      this as NotificationItemModel, $identity, $identity);
  @override
  String toString() {
    return NotificationItemModelMapper.ensureInitialized()
        .stringifyValue(this as NotificationItemModel);
  }

  @override
  bool operator ==(Object other) {
    return NotificationItemModelMapper.ensureInitialized()
        .equalsValue(this as NotificationItemModel, other);
  }

  @override
  int get hashCode {
    return NotificationItemModelMapper.ensureInitialized()
        .hashValue(this as NotificationItemModel);
  }
}

extension NotificationItemModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NotificationItemModel, $Out> {
  NotificationItemModelCopyWith<$R, NotificationItemModel, $Out>
      get $asNotificationItemModel => $base.as(
          (v, t, t2) => _NotificationItemModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class NotificationItemModelCopyWith<
    $R,
    $In extends NotificationItemModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get queryParams;
  $R call(
      {String? id,
      String? title,
      String? message,
      String? status,
      String? priorityLevel,
      Map<String, String>? queryParams,
      String? agentId,
      String? source,
      String? sourceId,
      String? sentAt,
      String? readAt,
      String? dismissedAt,
      String? label});
  NotificationItemModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NotificationItemModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NotificationItemModel, $Out>
    implements NotificationItemModelCopyWith<$R, NotificationItemModel, $Out> {
  _NotificationItemModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NotificationItemModel> $mapper =
      NotificationItemModelMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get queryParams => MapCopyWith(
          $value.queryParams,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(queryParams: v));
  @override
  $R call(
          {String? id,
          String? title,
          String? message,
          String? status,
          String? priorityLevel,
          Map<String, String>? queryParams,
          String? agentId,
          String? source,
          String? sourceId,
          Object? sentAt = $none,
          Object? readAt = $none,
          Object? dismissedAt = $none,
          Object? label = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (title != null) #title: title,
        if (message != null) #message: message,
        if (status != null) #status: status,
        if (priorityLevel != null) #priorityLevel: priorityLevel,
        if (queryParams != null) #queryParams: queryParams,
        if (agentId != null) #agentId: agentId,
        if (source != null) #source: source,
        if (sourceId != null) #sourceId: sourceId,
        if (sentAt != $none) #sentAt: sentAt,
        if (readAt != $none) #readAt: readAt,
        if (dismissedAt != $none) #dismissedAt: dismissedAt,
        if (label != $none) #label: label
      }));
  @override
  NotificationItemModel $make(CopyWithData data) => NotificationItemModel(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      message: data.get(#message, or: $value.message),
      status: data.get(#status, or: $value.status),
      priorityLevel: data.get(#priorityLevel, or: $value.priorityLevel),
      queryParams: data.get(#queryParams, or: $value.queryParams),
      agentId: data.get(#agentId, or: $value.agentId),
      source: data.get(#source, or: $value.source),
      sourceId: data.get(#sourceId, or: $value.sourceId),
      sentAt: data.get(#sentAt, or: $value.sentAt),
      readAt: data.get(#readAt, or: $value.readAt),
      dismissedAt: data.get(#dismissedAt, or: $value.dismissedAt),
      label: data.get(#label, or: $value.label));

  @override
  NotificationItemModelCopyWith<$R2, NotificationItemModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _NotificationItemModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
