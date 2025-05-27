enum ActivityScreenType {
  activity,
  archiveCalender,
  archiveActivity,
}

extension ActivityScreenTypeExtension on ActivityScreenType {
  bool get isActivity => this == ActivityScreenType.activity;
  bool get isArchive => this == ActivityScreenType.archiveActivity;
  bool get isArchiveCalender => this == ActivityScreenType.archiveCalender;
}