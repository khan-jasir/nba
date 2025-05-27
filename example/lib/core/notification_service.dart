import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

/// A service class that manages notification count state and persistence
class NotificationService {
  static const String _notificationCountKey = 'notification_count';
  static final ValueNotifier<int> notificationCount = ValueNotifier<int>(0);

  /// Initializes the notification service by loading the current count
  static Future<void> initialize() async {
    try {
      final count = await getNotificationCount();
      notificationCount.value = count;
    } catch (e) {
      debugPrint('Error initializing NotificationService: $e');
      notificationCount.value = 0;
    }
  }

  /// Increments the notification count and updates the persistent storage
  static Future<void> incrementNotificationCount() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final currentCount = prefs.getInt(_notificationCountKey) ?? 0;
      final newCount = currentCount + 1;
      await prefs.setInt(_notificationCountKey, newCount);
      notificationCount.value = newCount;
    } catch (e) {
      debugPrint('Error incrementing notification count: $e');
    }
  }

  /// Resets the notification count to zero
  static Future<void> resetNotificationCount() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_notificationCountKey, 0);
      notificationCount.value = 0;
    } catch (e) {
      debugPrint('Error resetting notification count: $e');
    }
  }

  /// Retrieves the current notification count from persistent storage
  static Future<int> getNotificationCount() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.reload();
      return prefs.getInt(_notificationCountKey) ?? 0;
    } catch (e) {
      debugPrint('Error getting notification count: $e');
      return 0;
    }
  }
} 