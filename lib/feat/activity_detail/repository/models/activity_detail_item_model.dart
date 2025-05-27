import 'package:dart_mappable/dart_mappable.dart';
import 'package:nba_sdk/feat/activity/repository/models/activity_details_data_model.dart';
import 'package:nba_sdk/feat/activity/repository/models/activity_item_model.dart';

part 'activity_detail_item_model.mapper.dart';

@MappableClass()
class ActivityDetailItemModel with ActivityDetailItemModelMappable {

  @MappableField(key: 'customerId')
  final String? customerId;
  @MappableField(key: 'referredBy')
  final String? referredBy;
  @MappableField(key: 'title')
  final String? title;
  @MappableField(key: 'fullName')
  final String? fullName;
  @MappableField(key: 'emailId')
  final String? emailId;
  @MappableField(key: 'countryCode')
  final String? countryCode;
  @MappableField(key: 'mobileNumber')
  final String? mobileNumber;
  @MappableField(key: 'status')
  final bool? status;
  @MappableField(key: 'dob')
  final String? dob;
  @MappableField(key: 'gender')
  final String? gender;
  @MappableField(key: 'lob')
  final String? lob;
  @MappableField(key: 'taskName')
  final String? taskName;
  @MappableField(key: 'taskDescription')
  final String? taskDescription;
  @MappableField(key: 'startDate')
  final String? startDate;
  @MappableField(key: 'endDate')
  final String? endDate;

  ActivityDetailItemModel({
    this.customerId,
    this.referredBy,
    this.title,
    this.fullName,
    this.emailId,
    this.countryCode,
    this.mobileNumber,
    this.status,
    this.dob,
    this.gender,
    this.lob,
    this.taskName,
    this.taskDescription,
    this.startDate,
    this.endDate,
  });

  ActivityItemModel toActivityItemModel(final String taskId) {
    return ActivityItemModel(
      id: taskId,
      taskName: taskName ?? '',
      taskDescription: taskDescription ?? '',
      lob: lob ?? '',
      startDate: startDate ?? '',
      endDate: endDate ?? '',
      details: ActivityDetailsDataModel(
        customerId: customerId,
        fullName: fullName,
        gender: gender,
        dob: dob,
        emailId: emailId,
        countryCode: countryCode,
        mobileNo: mobileNumber,
      ),
    );
  }
}