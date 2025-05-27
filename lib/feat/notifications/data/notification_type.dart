enum NotificationType {
  newLeadAssignments('New Lead Assignments'),
  paymentFailures('Payment Failures'),
  upSellCrossSell('Up-sell / Cross-sell'),
  newProductTraining('New Product Training'),
  webinarAlerts('Webinar Alerts'),
  beltLevelUpdates('Belt Level Updates'),
  birthday('Birthday');

  final String label;
  const NotificationType(this.label);
  
  static List<String> get labels => NotificationType.values.map((type) => type.label).toList();
} 