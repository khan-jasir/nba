import 'package:dart_mappable/dart_mappable.dart';
import 'package:intl/intl.dart';
import 'package:nba_sdk/feat/activity/repository/models/activity_details_data_model.dart';

part 'activity_item_model.mapper.dart';

enum PriorityLevel {
  low,
  medium,
  high,
}

extension PriorityLevelExtension on PriorityLevel {
  bool get isLow => this == PriorityLevel.low;
  bool get isMedium => this == PriorityLevel.medium;
  bool get isHigh => this == PriorityLevel.high;
}

@MappableClass()
class ActivityItemModel with ActivityItemModelMappable {

  @MappableField(key: 'id')
  final String id;
  @MappableField(key: 'taskName')
  final String taskName;
  @MappableField(key: 'taskDescription')
  final String taskDescription;
  @MappableField(key: 'startDate')
  final String? startDate;
  @MappableField(key: 'endDate')
  final String? endDate;
  @MappableField(key: 'dueDate')
  final String? dueDate;
  @MappableField(key: 'priorityLevel',)
  final String? priorityLevel;
  @MappableField(key: 'priorityOrder')
  final String? priorityOrder;
  @MappableField(key: 'taskSourceId')
  final String? taskSourceId;
  @MappableField(key: 'finalStatus')
  final String? finalStatus;
  @MappableField(key: 'lob')
  final String? lob;
  @MappableField(key: 'details')
  final ActivityDetailsDataModel? details;
  @MappableField(key: 'completedOn')
  final String? completedOn;
  @MappableField(key: 'oldPriority')
  final String? oldPriority;
  @MappableField(key: 'oldStatus')
  final String? oldStatus;
  @MappableField(key: 'currentStatus')
  final String? currentStatus;
  @MappableField(key: 'taskCreatedAt')
  final String? taskCreatedAt;

  ActivityItemModel({
    required this.id,
    required this.taskName,
    required this.taskDescription,
    this.startDate,
    this.endDate,
    this.dueDate,
    this.priorityLevel,
    this.priorityOrder,
    this.taskSourceId,
    this.finalStatus,
    this.lob,
    this.details,
    this.completedOn,
    this.oldPriority,
    this.oldStatus,
    this.currentStatus,
    this.taskCreatedAt,
  });

  String get formattedStarDate {
    if(startDate == null || startDate!.isEmpty) {
      return "";
    }

    final date = DateTime.parse(startDate!);
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  String get formattedEndDate {
    if(endDate == null || endDate!.isEmpty) {
      return "";
    }

    final date = DateTime.parse(endDate!);
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  String get taskHeader {
    if(taskName.isEmpty) {
      return "";
    }

    if(isBirthdayTask) {
      return "Birthday Wishes";
    } else if(isSellTask) {
      return "Cross-sell / Up-sell";
    } else if(isSipTask) {
      return "Collect Failed Payment";
    } else {
      return taskName; 
    }
  }

  String get taskHeading {
    if(isBirthdayTask) {
      return "Don't miss out on wishing ${details?.fullName} for their birthday!.";
    } else if(isSellTask) {
      return "New cross-sell opportunity to ${details?.fullName}.";
    } else if(isSipTask) {
      return "Collect failed payment from ${details?.fullName}.";
    } else {
      return "New Task"; // TODO: Add new task heading
    }
  }

  String get taskSubHeading {
    if(isBirthdayTask) {
      return "It's important to communicate with clients on special occasions";
    } else if(isSellTask) {
      return "With the recent product that has been purchased by ${details?.fullName} yesterday, we feel this product can be a perfect additional buy.";
    } else if(isSipTask) {
      return "${details?.fullName}'s payment  didn't go through. You can ask them to retry payment or collect a different record of payment made.";
    } else {
      return "New Task"; // TODO: Add new task subheading
    }
  }

  bool get isBirthdayTask {
    if(taskName.isEmpty) {
      return false;
    }

    final taskFullName = taskName.toLowerCase();

    if(taskFullName.contains("birthday")) {
      return true;
    } else {
      return false;
    }
  }

  bool get isSellTask {
    if(taskName.isEmpty) {
      return false;
    }
    
    final taskFullName = taskName.toLowerCase();

    if(taskFullName.contains("sell")) {
      return true;
    } else {
      return false;
    }
  }

  bool get isTrainingTask {
    if(taskName.isEmpty) {
      return false;
    }
    
    final taskFullName = taskName.toLowerCase();

    if(taskFullName.contains("training")) {
      return true;
    } else {
      return false;
    }
  } 

  bool get isSipTask {
    if(taskName.isEmpty) {
      return false;
    }
    
    final taskFullName = taskName.toLowerCase();

    if(taskFullName.contains("sip")) {
      return true;
    } else {
      return false;
    }
  }

  PriorityLevel get priorityLevelOfActivity {
    if(priorityLevel == null || priorityLevel!.isEmpty) {
      return PriorityLevel.low;
    } else if (priorityLevel!.toLowerCase() == 'low') {
      return PriorityLevel.low;
    } else if (priorityLevel!.toLowerCase() == 'medium') {
      return PriorityLevel.medium;
    } else {
      return PriorityLevel.high;
    }
  }

  PriorityLevel get oldPriorityLevel {
    if(oldPriority == null || oldPriority!.isEmpty) {
      return PriorityLevel.low;
    } else if (oldPriority!.toLowerCase() == 'low') {
      return PriorityLevel.low;
    } else if (oldPriority!.toLowerCase() == 'medium') {
      return PriorityLevel.medium;
    } else {
      return PriorityLevel.high;
    }
  }


  int get impactScore {
    if(isBirthdayTask) {
      return 40;
    } else if(isSellTask) {
      return 80;
    } else if(isSipTask) {
      return 90;
    } else if(isTrainingTask) {
      return 20;
    } else {
      return 0;
    }
  }

  bool get isCompleted {
    if(finalStatus == null || finalStatus!.isEmpty) {
      return false;
    }
    
    if(finalStatus!.toLowerCase() == 'completed') {
      return true;
    } else {
      return false;
    }
  }

  bool get isArchived {
    if(oldStatus == null || oldStatus!.isEmpty) {
      return false;
    }

    return true;
  }

  String get taskCreatedAtFormattedDate {
    if(taskCreatedAt == null || taskCreatedAt!.isEmpty) {
      return "";
    }

    final date = DateTime.parse(taskCreatedAt!);

    return DateFormat('dd-MMM-yyyy').format(date);
  }

  String get completedOnFormattedDate {
    if(completedOn == null || completedOn!.isEmpty) {
      return "";
    }

    final date = DateTime.parse(completedOn!);
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  String get dueDateFormattedDate {
    if(dueDate == null || dueDate!.isEmpty) {
      return "";
    }

    final date = DateTime.parse(dueDate!);
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  int get archiveActivityDueToDoneInterval {
    if(completedOn == null || completedOn!.isEmpty) {
      return 0;
    }
    if(dueDate == null || dueDate!.isEmpty) {
      return 0;
    }

    final completedDate = DateTime.parse(completedOn!);
    final dueDateTime = DateTime.parse(dueDate!);

    return dueDateTime.difference(completedDate).inDays;
  }

}
