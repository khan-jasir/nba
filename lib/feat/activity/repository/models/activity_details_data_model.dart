import 'package:dart_mappable/dart_mappable.dart';

part 'activity_details_data_model.mapper.dart';

@MappableClass()
class ActivityDetailsDataModel with ActivityDetailsDataModelMappable {

  @MappableField(key: 'customerId')
  final String? customerId;
  @MappableField(key: 'fullName')
  final String? fullName;
  @MappableField(key: 'gender')
  final String? gender;
  @MappableField(key: 'dob')
  final String? dob;
  @MappableField(key: 'emailId')
  final String? emailId;
  @MappableField(key: 'countryCode')
  final String? countryCode;
  @MappableField(key: 'mobileNo')
  final String? mobileNo;

  ActivityDetailsDataModel({
    this.customerId,
    this.fullName,
    this.gender,
    this.dob,
    this.emailId,
    this.countryCode,
    this.mobileNo,
  });

  // calculate age from dob
  int get clientAge {
    if(dob == null) {
      return 0;
    }

    final dobDate = DateTime.parse(dob!);
    final today = DateTime.now();
    final age = today.year - dobDate.year;
    return age;
  }
  
}
