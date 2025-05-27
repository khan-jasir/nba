import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nba_sdk/feat/core/network/api_status.dart';
import 'package:nba_sdk/feat/notifications/cubit/notification_filter.dart';
import 'package:nba_sdk/feat/notifications/data/notification_type.dart';
import 'package:nba_sdk/feat/notifications/models/notification_item_model.dart';
import 'package:nba_sdk/feat/notifications/repository/notification_repository.dart';
import 'package:nba_sdk/feat/notifications/widgets/notification_status_btn.dart';

part 'notification_state.dart';

class 

NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit({
    required NotificationRepository repository,
  }) : _repository = repository, super(NotificationState());

  final NotificationRepository _repository;

  Future<void> getNotifications() async {
    emit(state.copyWith(notifcationApiStatus: ApiStatus.loading));

    try {
      final response = await _repository.getNotifications();
      final (filteredNotifications, isEmpty) = NotificationFilter.getNotificationFilter(response.notifications ?? [], state.selectedNotificationStatus, state.selectedNotificationTypes);
      emit(state.copyWith(notifcationApiStatus: ApiStatus.success, notifications: filteredNotifications, isEmpty: isEmpty));
    } catch (e) {
      emit(state.copyWith(notifcationApiStatus: ApiStatus.error));
    }
  }

  Future<void> toggleNotificationStatus(NotificationStatus status) async {
    emit(state.copyWith(selectedNotificationStatus: status));
    getNotifications();
  }

  Future<void> addFilters(Set<NotificationType> types) async {
    final Set<NotificationType> newTypes = types;
    emit(state.copyWith(selectedNotificationTypes: newTypes));
    getNotifications();
  }

  Future<void> resetFilters() async {
    emit(state.copyWith(selectedNotificationTypes: {}));
    getNotifications();
  }

  Future<void> markAsRead(String id) async {
   try {
    await _repository.markAsRead(id);
    getNotifications();
   } catch (e) {
     print(e);
   }
  }
}
