
import 'package:nba_sdk/feat/activity/repository/models/activity_item_model.dart';

enum ActivitySortBy {
  priority('Priority'),
  impact('Impact'),
  actionType('Action Type'),
  activityType('Activity Type');

  const ActivitySortBy(this.value);
  final String value;
}

enum ActivityBuckets {
  low('Low'),
  high('High'),
  medium('Medium'),
  runYourBusiness('Run Your Business'),
  growYourBusiness('Grow Your Business'),
  manageRelationships('Manage Relationships'),
  selfImprovement('Self Improvement'),
  birthDayWishes('Birthday Wishes'),
  crossSellOpportunity('Cross-Sell Opportunity'),
  failedTransaction('Failed Transaction'),
  training('Training');

  const ActivityBuckets(this.value);
  final String value;
}

class ActivitySortModel {
  ActivitySortModel({
    required this.low,
    required this.lowList,
    required this.medium,
    required this.mediumList,
    required this.high,
    required this.highList,
    required this.runYourBusiness,
    required this.runYourBusinessList,
    required this.growYourBusiness,
    required this.growYourBusinessList,
    required this.manageRelationships,
    required this.manageRelationshipsList,
    required this.selfImprovement,
    required this.selfImprovementList,
    required this.birthDayWishes,
    required this.birthDayWishesList,
    required this.crossSellOpportunity,
    required this.crossSellOpportunityList,
    required this.failedTransaction,
    required this.failedTransactionList,
    required this.training,
    required this.trainingList,
  });

  ActivityBuckets low;
  List<ActivityItemModel> lowList;

  ActivityBuckets medium;
  List<ActivityItemModel> mediumList;

  ActivityBuckets high;
  List<ActivityItemModel> highList;

  ActivityBuckets runYourBusiness;
  List<ActivityItemModel> runYourBusinessList;

  ActivityBuckets growYourBusiness;
  List<ActivityItemModel> growYourBusinessList;

  ActivityBuckets manageRelationships;
  List<ActivityItemModel> manageRelationshipsList;

  ActivityBuckets selfImprovement;
  List<ActivityItemModel> selfImprovementList;

  ActivityBuckets birthDayWishes;
  List<ActivityItemModel> birthDayWishesList;

  ActivityBuckets crossSellOpportunity;
  List<ActivityItemModel> crossSellOpportunityList;

  ActivityBuckets failedTransaction;
  List<ActivityItemModel> failedTransactionList;

  ActivityBuckets training;
  List<ActivityItemModel> trainingList;
  

}

class ArchiveActivitySortManager {

  static final List<String> _runYourBusiness = ['Run Your Business'];
  static final List<String> _growYourBusiness = ['Transaction','Cross-Sell'];
  static final List<String> _manageRelationships = ['Birthday'];
  static final List<String> _selfImprovement = ['Training'];

  static final List<String> _birthDayWishes = ['Birthday'];
  static final List<String> _crossSellOpportunity = ['Cross-Sell'];
  static final List<String> _failedTransaction = ['Failed Transaction'];
  static final List<String> _training = ['Training'];


  static ActivitySortModel sort(List<ActivityItemModel> activities, ActivitySortBy sortBy) {
    final lowList = activities.where((element) => (element.oldPriority?.toLowerCase() ?? '') == 'low').toList();
    final mediumList = activities.where((element) => (element.oldPriority?.toLowerCase() ?? '') == 'medium').toList();
    final highList = activities.where((element) => (element.oldPriority?.toLowerCase() ?? '') == 'high').toList();


    if(sortBy == ActivitySortBy.priority) {
      return ActivitySortModel(
        low: ActivityBuckets.low,
        lowList: _sortByPriority(lowList),
        medium: ActivityBuckets.medium,
        mediumList: _sortByPriority(mediumList),
        high: ActivityBuckets.high,
        highList: _sortByPriority(highList),
        runYourBusiness: ActivityBuckets.runYourBusiness,
        runYourBusinessList: [],
        growYourBusiness: ActivityBuckets.growYourBusiness,
        growYourBusinessList: [],
        manageRelationships: ActivityBuckets.manageRelationships,
        manageRelationshipsList: [],
        selfImprovement: ActivityBuckets.selfImprovement,
        selfImprovementList: [],
        birthDayWishes: ActivityBuckets.birthDayWishes,
        birthDayWishesList: [],
        crossSellOpportunity: ActivityBuckets.crossSellOpportunity,
        crossSellOpportunityList: [],
        failedTransaction: ActivityBuckets.failedTransaction,
        failedTransactionList: [],
        training: ActivityBuckets.training,
        trainingList: [],
      );
    } else if(sortBy == ActivitySortBy.impact) {
      return ActivitySortModel(
        low: ActivityBuckets.low,
        lowList: _sortByImpact(lowList),
        medium: ActivityBuckets.medium,
        mediumList: _sortByImpact(mediumList),
        high: ActivityBuckets.high,
        highList: _sortByImpact(highList),
        runYourBusiness: ActivityBuckets.runYourBusiness,
        runYourBusinessList: [],
        growYourBusiness: ActivityBuckets.growYourBusiness,
        growYourBusinessList: [],
        manageRelationships: ActivityBuckets.manageRelationships,
        manageRelationshipsList: [],
        selfImprovement: ActivityBuckets.selfImprovement,
        selfImprovementList: [],
        birthDayWishes: ActivityBuckets.birthDayWishes,
        birthDayWishesList: [],
        crossSellOpportunity: ActivityBuckets.crossSellOpportunity,
        crossSellOpportunityList: [],
        failedTransaction: ActivityBuckets.failedTransaction,
        failedTransactionList: [],
        training: ActivityBuckets.training,
        trainingList: [],
      );
    } else if(sortBy == ActivitySortBy.actionType) {
      return ActivitySortModel(
        low: ActivityBuckets.low,
        lowList: [],
        medium: ActivityBuckets.medium,
        mediumList: [],
        high: ActivityBuckets.high,
        highList: [],
        runYourBusiness: ActivityBuckets.runYourBusiness,
        runYourBusinessList: _sortByActionType(activities, ActivityBuckets.runYourBusiness),
        growYourBusiness: ActivityBuckets.growYourBusiness,
        growYourBusinessList: _sortByActionType(activities, ActivityBuckets.growYourBusiness),
        manageRelationships: ActivityBuckets.manageRelationships,
        manageRelationshipsList: _sortByActionType(activities, ActivityBuckets.manageRelationships),
        selfImprovement: ActivityBuckets.selfImprovement,
        selfImprovementList: _sortByActionType(activities, ActivityBuckets.selfImprovement),
        birthDayWishes: ActivityBuckets.birthDayWishes,
        birthDayWishesList: [],
        crossSellOpportunity: ActivityBuckets.crossSellOpportunity,
        crossSellOpportunityList: [],
        failedTransaction: ActivityBuckets.failedTransaction,
        failedTransactionList: [],
        training: ActivityBuckets.training,
        trainingList: [],
      );
    } else {
      return ActivitySortModel(
        low: ActivityBuckets.low,
        lowList: [],
        medium: ActivityBuckets.medium,
        mediumList: [],
        high: ActivityBuckets.high,
        highList: [],
        runYourBusiness: ActivityBuckets.runYourBusiness,
        runYourBusinessList: [],
        growYourBusiness: ActivityBuckets.growYourBusiness,
        growYourBusinessList: [],
        manageRelationships: ActivityBuckets.manageRelationships,
        manageRelationshipsList: [],
        selfImprovement: ActivityBuckets.selfImprovement,
        selfImprovementList: [],
        birthDayWishes: ActivityBuckets.birthDayWishes,
        birthDayWishesList: _sortByActivityType(activities, ActivityBuckets.birthDayWishes),
        crossSellOpportunity: ActivityBuckets.crossSellOpportunity,
        crossSellOpportunityList: _sortByActivityType(activities, ActivityBuckets.crossSellOpportunity),
        failedTransaction: ActivityBuckets.failedTransaction,
        failedTransactionList: _sortByActivityType(activities, ActivityBuckets.failedTransaction),
        training: ActivityBuckets.training,
        trainingList: _sortByActivityType(activities, ActivityBuckets.training),
      );
    }
  }

  static List<ActivityItemModel> _sortByPriority(List<ActivityItemModel> activities) {
    activities.sort((a, b) {
      final aScore = int.parse(a.priorityOrder ?? '0');
      final bScore = int.parse(b.priorityOrder ?? '0');
      return aScore.compareTo(bScore);
    });
    return activities;
  }

  static List<ActivityItemModel> _sortByImpact(List<ActivityItemModel> activities) {
    activities.sort((a, b) {
      final aScore = a.impactScore;
      final bScore = b.impactScore;
      return bScore.compareTo(aScore);
    });
    return activities;
  }


 static List<String> _getActionTypeList(ActivityBuckets bucket) {
    switch(bucket) {
      case ActivityBuckets.runYourBusiness:
        return _runYourBusiness;
      case ActivityBuckets.growYourBusiness:
        return _growYourBusiness;
      case ActivityBuckets.manageRelationships:
        return _manageRelationships;
      case ActivityBuckets.selfImprovement:
        return _selfImprovement;
      default:
        return [];
    }
  }

  static List<ActivityItemModel> _sortByActionType(List<ActivityItemModel> activities, ActivityBuckets bucket) {
   final filteredActivities = activities.where((element) {
      for(String actionType in _getActionTypeList(bucket)) {
        if(element.taskName.toLowerCase().contains(actionType.toLowerCase())) {
          return true;
        }
      }
      return false;
    }).toList();
    print(bucket.value);
    print(filteredActivities.length);
    return filteredActivities;
  }

  static List<String> _getActivityTypeList(ActivityBuckets bucket) {
    switch(bucket) {
      case ActivityBuckets.birthDayWishes:
        return _birthDayWishes;
      case ActivityBuckets.crossSellOpportunity:
        return _crossSellOpportunity; 
      case ActivityBuckets.failedTransaction:
        return _failedTransaction;
      case ActivityBuckets.training:
        return _training;
      default:
        return [];
    } 
  }
  

  static List<ActivityItemModel> _sortByActivityType(List<ActivityItemModel> activities, ActivityBuckets bucket) {
    final filteredActivities = activities.where((element) {
      for(String actionType in _getActivityTypeList(bucket)) {
        if(element.taskName.toLowerCase().contains(actionType.toLowerCase())) {
          return true;
        }
      }
      return false;
    }).toList();
    return filteredActivities;
  }
}

class ActivitySortManager {

  static final List<String> _runYourBusiness = ['Run Your Business'];
  static final List<String> _growYourBusiness = ['Transaction','Cross-Sell'];
  static final List<String> _manageRelationships = ['Birthday'];
  static final List<String> _selfImprovement = ['Training'];


  static final List<String> _birthDayWishes = ['Birthday'];
  static final List<String> _crossSellOpportunity = ['Cross-Sell'];
  static final List<String> _failedTransaction = ['Failed Transaction'];
  static final List<String> _training = ['Training'];

  
  static ActivitySortModel sort(List<ActivityItemModel> activities, ActivitySortBy sortBy) {
    final lowList = activities.where((element) => (element.priorityLevel?.toLowerCase() ?? '') == 'low').toList();
    final mediumList = activities.where((element) => (element.priorityLevel?.toLowerCase() ?? '') == 'medium').toList();
    final highList = activities.where((element) => (element.priorityLevel?.toLowerCase() ?? '') == 'high').toList();

    if(sortBy == ActivitySortBy.priority) {
      return ActivitySortModel(
        low: ActivityBuckets.low,
        lowList: _sortByPriority(lowList),
        medium: ActivityBuckets.medium,
        mediumList: _sortByPriority(mediumList),
        high: ActivityBuckets.high,
        highList: _sortByPriority(highList),
        runYourBusiness: ActivityBuckets.runYourBusiness,
        runYourBusinessList: [],
        growYourBusiness: ActivityBuckets.growYourBusiness,
        growYourBusinessList: [],
        manageRelationships: ActivityBuckets.manageRelationships,
        manageRelationshipsList: [],
        selfImprovement: ActivityBuckets.selfImprovement,
        selfImprovementList: [],
        birthDayWishes: ActivityBuckets.birthDayWishes,
        birthDayWishesList: [],
        crossSellOpportunity: ActivityBuckets.crossSellOpportunity,
        crossSellOpportunityList: [],
        failedTransaction: ActivityBuckets.failedTransaction,
        failedTransactionList: [],
        training: ActivityBuckets.training,
        trainingList: [],
      );
    } else if(sortBy == ActivitySortBy.impact) {
      return ActivitySortModel(
        low: ActivityBuckets.low,
        lowList: _sortByImpact(lowList),
        medium: ActivityBuckets.medium,
        mediumList: _sortByImpact(mediumList),
        high: ActivityBuckets.high,
        highList: _sortByImpact(highList),
        runYourBusiness: ActivityBuckets.runYourBusiness,
        runYourBusinessList: [],
        growYourBusiness: ActivityBuckets.growYourBusiness,
        growYourBusinessList: [],
        manageRelationships: ActivityBuckets.manageRelationships,
        manageRelationshipsList: [],
        selfImprovement: ActivityBuckets.selfImprovement,
        selfImprovementList: [],
        birthDayWishes: ActivityBuckets.birthDayWishes,
        birthDayWishesList: [],
        crossSellOpportunity: ActivityBuckets.crossSellOpportunity,
        crossSellOpportunityList: [],
        failedTransaction: ActivityBuckets.failedTransaction,
        failedTransactionList: [],
        training: ActivityBuckets.training,
        trainingList: [],
      );
    } else if(sortBy == ActivitySortBy.actionType) {
      return ActivitySortModel(
        low: ActivityBuckets.low,
        lowList: [],
        medium: ActivityBuckets.medium,
        mediumList: [],
        high: ActivityBuckets.high,
        highList: [],
        runYourBusiness: ActivityBuckets.runYourBusiness,
        runYourBusinessList: _sortByActionType(activities, ActivityBuckets.runYourBusiness),
        growYourBusiness: ActivityBuckets.growYourBusiness,
        growYourBusinessList: _sortByActionType(activities, ActivityBuckets.growYourBusiness),
        manageRelationships: ActivityBuckets.manageRelationships,
        manageRelationshipsList: _sortByActionType(activities, ActivityBuckets.manageRelationships),
        selfImprovement: ActivityBuckets.selfImprovement,
        selfImprovementList: _sortByActionType(activities, ActivityBuckets.selfImprovement),
        birthDayWishes: ActivityBuckets.birthDayWishes,
        birthDayWishesList: [],
        crossSellOpportunity: ActivityBuckets.crossSellOpportunity,
        crossSellOpportunityList: [],
        failedTransaction: ActivityBuckets.failedTransaction,
        failedTransactionList: [],
        training: ActivityBuckets.training,
        trainingList: [],
      );
    } else {
      return ActivitySortModel(
        low: ActivityBuckets.low,
        lowList: [],
        medium: ActivityBuckets.medium,
        mediumList: [],
        high: ActivityBuckets.high,
        highList: [],
        runYourBusiness: ActivityBuckets.runYourBusiness,
        runYourBusinessList: [],
        growYourBusiness: ActivityBuckets.growYourBusiness,
        growYourBusinessList: [],
        manageRelationships: ActivityBuckets.manageRelationships,
        manageRelationshipsList: [],
        selfImprovement: ActivityBuckets.selfImprovement,
        selfImprovementList: [],
        birthDayWishes: ActivityBuckets.birthDayWishes,
        birthDayWishesList: _sortByActivityType(activities, ActivityBuckets.birthDayWishes),
        crossSellOpportunity: ActivityBuckets.crossSellOpportunity,
        crossSellOpportunityList: _sortByActivityType(activities, ActivityBuckets.crossSellOpportunity),
        failedTransaction: ActivityBuckets.failedTransaction,
        failedTransactionList: _sortByActivityType(activities, ActivityBuckets.failedTransaction),
        training: ActivityBuckets.training,
        trainingList: _sortByActivityType(activities, ActivityBuckets.training),
      );
    }
  }

  static List<ActivityItemModel> _sortByPriority(List<ActivityItemModel> activities) {
    activities.sort((a, b) {
      final aScore = int.parse(a.priorityOrder ?? '0');
      final bScore = int.parse(b.priorityOrder ?? '0');
      return aScore.compareTo(bScore);
    });
    return activities;
  }

  static List<ActivityItemModel> _sortByImpact(List<ActivityItemModel> activities) {
   // loop over activities check thier impact score and sort them accordingly
   activities.sort((a, b) {
    final aScore = a.impactScore;
    final bScore = b.impactScore;
    return bScore.compareTo(aScore);
   });
   return activities;
  }

  static List<String> _getActionTypeList(ActivityBuckets bucket) {
    switch(bucket) {
      case ActivityBuckets.runYourBusiness:
        return _runYourBusiness;
      case ActivityBuckets.growYourBusiness:
        return _growYourBusiness;
      case ActivityBuckets.manageRelationships:
        return _manageRelationships;
      case ActivityBuckets.selfImprovement:
        return _selfImprovement;
      default:
        return [];
    }
  }

  static List<ActivityItemModel> _sortByActionType(List<ActivityItemModel> activities, ActivityBuckets bucket) {
   final filteredActivities = activities.where((element) {
      for(String actionType in _getActionTypeList(bucket)) {
        if(element.taskName.toLowerCase().contains(actionType.toLowerCase())) {
          return true;
        }
      }
      return false;
    }).toList();
    print(bucket.value);
    print(filteredActivities.length);
    return filteredActivities;
  }

  static List<String> _getActivityTypeList(ActivityBuckets bucket) {
    switch(bucket) {
      case ActivityBuckets.birthDayWishes:
        return _birthDayWishes;
      case ActivityBuckets.crossSellOpportunity:
        return _crossSellOpportunity; 
      case ActivityBuckets.failedTransaction:
        return _failedTransaction;
      case ActivityBuckets.training:
        return _training;
      default:
        return [];
    } 
  }
  

  static List<ActivityItemModel> _sortByActivityType(List<ActivityItemModel> activities, ActivityBuckets bucket) {
    final filteredActivities = activities.where((element) {
      for(String actionType in _getActivityTypeList(bucket)) {
        if(element.taskName.toLowerCase().contains(actionType.toLowerCase())) {
          return true;
        }
      }
      return false;
    }).toList();
    return filteredActivities;
  }

}