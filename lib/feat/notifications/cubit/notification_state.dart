part of 'notification_cubit.dart';

class NotificationState extends Equatable {
  const NotificationState({
    this.notifcationApiStatus = ApiStatus.initial,
    this.selectedNotificationStatus = NotificationStatus.read,
    this.notifications = const [],
    this.selectedNotificationTypes = const {},
    this.isEmpty = true,
  });

  final ApiStatus notifcationApiStatus;
  final NotificationStatus selectedNotificationStatus;
  final List<NotificationFilterModel> notifications;
  final Set<NotificationType> selectedNotificationTypes;
  final bool isEmpty;

  NotificationState copyWith({
    ApiStatus? notifcationApiStatus,
    NotificationStatus? selectedNotificationStatus,
    List<NotificationFilterModel>? notifications,
    Set<NotificationType>? selectedNotificationTypes,
    bool? isEmpty,
  }) {
    return NotificationState(
      notifcationApiStatus: notifcationApiStatus ?? this.notifcationApiStatus,
      selectedNotificationStatus:
          selectedNotificationStatus ?? this.selectedNotificationStatus,
      notifications: notifications ?? this.notifications,
      selectedNotificationTypes:
          selectedNotificationTypes ?? this.selectedNotificationTypes,
      isEmpty: isEmpty ?? this.isEmpty,
    );
  }

  @override
  List<Object?> get props => [
    notifcationApiStatus,
    selectedNotificationStatus,
    notifications,
    selectedNotificationTypes,
    isEmpty,
  ];
}
