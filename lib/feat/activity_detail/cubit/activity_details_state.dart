part of 'activity_details_cubit.dart';

class ActivityDetailsState extends Equatable {
  final List<PlatformFile> commentAttachments;
  final FetchCommentsModel? comments;
  final ApiStatus status;
  final ActivityItemModel? activityDetail;
  final ApiStatus activityDetailStatus;
  final String? error;

  const ActivityDetailsState({
    this.commentAttachments = const [],
    this.comments, 
    this.status = ApiStatus.initial, 
    this.error,
    this.activityDetail,
    this.activityDetailStatus = ApiStatus.initial,
  });

  ActivityDetailsState copyWith({
    List<PlatformFile>? commentAttachments,
    FetchCommentsModel? comments,
    ApiStatus? status,
    String? error,
    ActivityItemModel? activityDetail,
    ApiStatus? activityDetailStatus,
  }) {
    return ActivityDetailsState(
      commentAttachments: commentAttachments ?? this.commentAttachments,
      comments: comments ?? this.comments,
      status: status ?? this.status,
      error: error ?? this.error,
      activityDetail: activityDetail ?? this.activityDetail,
      activityDetailStatus: activityDetailStatus ?? this.activityDetailStatus,
    );
  }

  @override
  List<Object?> get props => [
    commentAttachments,
    comments,
    status,
    error,
    activityDetail,
    activityDetailStatus,
  ];
}
