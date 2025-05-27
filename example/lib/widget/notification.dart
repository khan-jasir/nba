import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nba/core/notification_service.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({
    super.key,
    required this.onNotificationIconPressed,
  });

  final Function() onNotificationIconPressed;

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    NotificationService.initialize();
  }

  @override
void didChangeAppLifecycleState(AppLifecycleState state) {
  if (state == AppLifecycleState.resumed) {
    NotificationService.initialize(); // Re-sync count on resume
  }
}

@override
void dispose() {
  WidgetsBinding.instance.removeObserver(this);
  super.dispose();
}


  // void _setupNotificationListener() {
  //   // Listen for foreground messages
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
  //     if (message.data['isInApp'] == 'true') {
  //       await NotificationService.incrementNotificationCount();
  //     }
  //   });

  //   // Listen for background messages
  //   FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
  //     if (message.data['isInApp'] == 'true') {
  //       await NotificationService.incrementNotificationCount();
  //     }
  //     return Future.value();
  //   });
  // }

  Future<void> _reset() async {
    await NotificationService.resetNotificationCount();
  }
  
  Widget _buildNotificationWithBadge() {
    return IconButton(
      icon: ValueListenableBuilder<int>(
        valueListenable: NotificationService.notificationCount,
        builder: (context, count, child) {
          return Badge.count(
            backgroundColor: Color(0xffFF8A00),
            count: count,
            child: SvgPicture.asset(
              'assets/icons/notification.svg',
              width: 22,
              height: 22,
            ),
          );
        },
      ),
      onPressed: () {
        _reset();
        widget.onNotificationIconPressed();
      },
    );
  }

  Widget _buildNotificationWithoutBadge() {
    return IconButton(
      onPressed: () {
        _reset();
        widget.onNotificationIconPressed();
      },
      icon: SvgPicture.asset(
        'assets/icons/notification.svg',
        width: 22,
        height: 22,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: NotificationService.notificationCount,
      builder: (context, count, child) {
        return count > 0
            ? _buildNotificationWithBadge()
            : _buildNotificationWithoutBadge();
      },
    );
  }
}
