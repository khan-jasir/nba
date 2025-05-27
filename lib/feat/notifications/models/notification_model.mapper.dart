// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'notification_model.dart';

class NotificationModelMapper extends ClassMapperBase<NotificationModel> {
  NotificationModelMapper._();

  static NotificationModelMapper? _instance;
  static NotificationModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NotificationModelMapper._());
      NotificationItemModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'NotificationModel';

  static int? _$totalCount(NotificationModel v) => v.totalCount;
  static const Field<NotificationModel, int> _f$totalCount =
      Field('totalCount', _$totalCount, opt: true);
  static int? _$unreadCount(NotificationModel v) => v.unreadCount;
  static const Field<NotificationModel, int> _f$unreadCount =
      Field('unreadCount', _$unreadCount, opt: true);
  static bool? _$hasMore(NotificationModel v) => v.hasMore;
  static const Field<NotificationModel, bool> _f$hasMore =
      Field('hasMore', _$hasMore, opt: true);
  static int? _$pageNumber(NotificationModel v) => v.pageNumber;
  static const Field<NotificationModel, int> _f$pageNumber =
      Field('pageNumber', _$pageNumber, opt: true);
  static int? _$pageSize(NotificationModel v) => v.pageSize;
  static const Field<NotificationModel, int> _f$pageSize =
      Field('pageSize', _$pageSize, opt: true);
  static List<NotificationItemModel>? _$notifications(NotificationModel v) =>
      v.notifications;
  static const Field<NotificationModel, List<NotificationItemModel>>
      _f$notifications = Field('notifications', _$notifications, opt: true);

  @override
  final MappableFields<NotificationModel> fields = const {
    #totalCount: _f$totalCount,
    #unreadCount: _f$unreadCount,
    #hasMore: _f$hasMore,
    #pageNumber: _f$pageNumber,
    #pageSize: _f$pageSize,
    #notifications: _f$notifications,
  };

  static NotificationModel _instantiate(DecodingData data) {
    return NotificationModel(
        totalCount: data.dec(_f$totalCount),
        unreadCount: data.dec(_f$unreadCount),
        hasMore: data.dec(_f$hasMore),
        pageNumber: data.dec(_f$pageNumber),
        pageSize: data.dec(_f$pageSize),
        notifications: data.dec(_f$notifications));
  }

  @override
  final Function instantiate = _instantiate;

  static NotificationModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NotificationModel>(map);
  }

  static NotificationModel fromJson(String json) {
    return ensureInitialized().decodeJson<NotificationModel>(json);
  }
}

mixin NotificationModelMappable {
  String toJson() {
    return NotificationModelMapper.ensureInitialized()
        .encodeJson<NotificationModel>(this as NotificationModel);
  }

  Map<String, dynamic> toMap() {
    return NotificationModelMapper.ensureInitialized()
        .encodeMap<NotificationModel>(this as NotificationModel);
  }

  NotificationModelCopyWith<NotificationModel, NotificationModel,
          NotificationModel>
      get copyWith =>
          _NotificationModelCopyWithImpl<NotificationModel, NotificationModel>(
              this as NotificationModel, $identity, $identity);
  @override
  String toString() {
    return NotificationModelMapper.ensureInitialized()
        .stringifyValue(this as NotificationModel);
  }

  @override
  bool operator ==(Object other) {
    return NotificationModelMapper.ensureInitialized()
        .equalsValue(this as NotificationModel, other);
  }

  @override
  int get hashCode {
    return NotificationModelMapper.ensureInitialized()
        .hashValue(this as NotificationModel);
  }
}

extension NotificationModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NotificationModel, $Out> {
  NotificationModelCopyWith<$R, NotificationModel, $Out>
      get $asNotificationModel => $base
          .as((v, t, t2) => _NotificationModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class NotificationModelCopyWith<$R, $In extends NotificationModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      NotificationItemModel,
      NotificationItemModelCopyWith<$R, NotificationItemModel,
          NotificationItemModel>>? get notifications;
  $R call(
      {int? totalCount,
      int? unreadCount,
      bool? hasMore,
      int? pageNumber,
      int? pageSize,
      List<NotificationItemModel>? notifications});
  NotificationModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NotificationModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NotificationModel, $Out>
    implements NotificationModelCopyWith<$R, NotificationModel, $Out> {
  _NotificationModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NotificationModel> $mapper =
      NotificationModelMapper.ensureInitialized();
  @override
  ListCopyWith<
          $R,
          NotificationItemModel,
          NotificationItemModelCopyWith<$R, NotificationItemModel,
              NotificationItemModel>>?
      get notifications => $value.notifications != null
          ? ListCopyWith($value.notifications!, (v, t) => v.copyWith.$chain(t),
              (v) => call(notifications: v))
          : null;
  @override
  $R call(
          {Object? totalCount = $none,
          Object? unreadCount = $none,
          Object? hasMore = $none,
          Object? pageNumber = $none,
          Object? pageSize = $none,
          Object? notifications = $none}) =>
      $apply(FieldCopyWithData({
        if (totalCount != $none) #totalCount: totalCount,
        if (unreadCount != $none) #unreadCount: unreadCount,
        if (hasMore != $none) #hasMore: hasMore,
        if (pageNumber != $none) #pageNumber: pageNumber,
        if (pageSize != $none) #pageSize: pageSize,
        if (notifications != $none) #notifications: notifications
      }));
  @override
  NotificationModel $make(CopyWithData data) => NotificationModel(
      totalCount: data.get(#totalCount, or: $value.totalCount),
      unreadCount: data.get(#unreadCount, or: $value.unreadCount),
      hasMore: data.get(#hasMore, or: $value.hasMore),
      pageNumber: data.get(#pageNumber, or: $value.pageNumber),
      pageSize: data.get(#pageSize, or: $value.pageSize),
      notifications: data.get(#notifications, or: $value.notifications));

  @override
  NotificationModelCopyWith<$R2, NotificationModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _NotificationModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
