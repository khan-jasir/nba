import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:nba_sdk/feat/activity/repository/models/activity_item_model.dart';
import 'package:nba_sdk/feat/core/network/api_status.dart';

import '../repository/respository.dart';

part 'activity_details_state.dart';

class ActivityDetailsCubit extends Cubit<ActivityDetailsState> {
  ActivityDetailsCubit() : super(ActivityDetailsState());

  final ActivityDetailRepository _activityDetailRepository = ActivityDetailRepositoryImpl();

  void fetchActivityDetail(String taskId) async {
    try {
      emit(state.copyWith(activityDetailStatus: ApiStatus.loading));
      final response = await _activityDetailRepository.fetchActivityDetail(taskId);
      emit(state.copyWith(activityDetail: response, activityDetailStatus: ApiStatus.success));
    } catch (e) {
      emit(state.copyWith(activityDetailStatus: ApiStatus.error, error: e.toString()));
    }
  }

  void fetchComments(String taskId) async {
    emit(state.copyWith(status: ApiStatus.loading));
    try {
      final response = await _activityDetailRepository.fetchComments(taskId);
      emit(state.copyWith(comments: response, status: ApiStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ApiStatus.error, error: e.toString()));
    }
  }

  void addComment(String content, String taskId) async {
    try {
      await _activityDetailRepository.addComment(state.commentAttachments, content, taskId);
      emit(state.copyWith(status: ApiStatus.success));
      fetchComments(taskId);
    } catch (e) {
      emit(state.copyWith(status: ApiStatus.error, error: e.toString()));
    }
  }

  void deleteComment(String commentId, String taskId) async {
    try {
      await _activityDetailRepository.deleteComment(commentId, taskId);
      emit(state.copyWith(status: ApiStatus.success));
      fetchComments(taskId);
    } catch (e) {
      emit(state.copyWith(status: ApiStatus.error, error: e.toString()));
    }
  }

  void updateCommentAttachment(String attachmentId, String commentId, String taskId) async {
    try {
      await _activityDetailRepository.updateCommentAttachment(attachmentId, commentId, taskId);
      emit(state.copyWith(status: ApiStatus.success));
      fetchComments(taskId);
    } catch (e) {
      emit(state.copyWith(status: ApiStatus.error, error: e.toString()));
    }
  }

  void updateComment(String comment, String taskId, String commentId) async {
    try {
      await _activityDetailRepository.updateComment(state.commentAttachments, commentId, taskId, comment);
      emit(state.copyWith(status: ApiStatus.success));
      fetchComments(taskId);
    } catch (e) {
      emit(state.copyWith(status: ApiStatus.error, error: e.toString()));
    }
  }



  void addCommentAttachments(List<PlatformFile> files) {
    final currentAttachments = List<PlatformFile>.from(state.commentAttachments);
    currentAttachments.addAll(files);
    emit(state.copyWith(commentAttachments: currentAttachments));
  }

  void removeCommentAttachment(int index) {
    final currentAttachments = List<PlatformFile>.from(state.commentAttachments);
    currentAttachments.removeAt(index);
    emit(state.copyWith(commentAttachments: currentAttachments));
  }

  void clearCommentAttachments() {
    emit(state.copyWith(commentAttachments: []));
  }

}
