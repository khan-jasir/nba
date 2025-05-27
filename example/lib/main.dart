import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:nba/core/firebase_push_notifications.dart';
import 'package:nba/core/notification_service.dart';
import 'package:nba/widget/notification.dart';
import 'package:nba_sdk/core/config/sdk_config.dart';
import 'package:nba_sdk/nba_sdk.dart';


void main() async {
 try {
    WidgetsFlutterBinding.ensureInitialized();
    NbaSdk.init(SdkConfig(
      apiBaseUrl: 'http://34.47.178.99',
    ));
    //Initialize Firebase

    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyBc-Py10SMhC80yKSb6mtMVKam2828ALMo',
        appId: '1:1030423178366:android:31af7101e3cf0677657c2f',
        messagingSenderId: '1030423178366',
        projectId: 'nba-frontend-20330',
        storageBucket: 'nba-frontend-20330.firebasestorage.app',
      ),
    );

   // Initialize services
    await Future.wait([
      FirebasePushNotifications.init(),
      NotificationService.initialize(),
    ]);

  final initialMessage = await FirebasePushNotifications.getInitialMessage();
  print('Initial Message: $initialMessage');
  runApp(MyApp(initialMessage: initialMessage));
 } catch (e) {
  print(e);
 }
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key, this.initialMessage});

  final RemoteMessage? initialMessage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: FirebasePushNotifications.navigatorKey,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(initialMessage: initialMessage),
        '/notifications': (context) => NbaSdk.notification(),
      },
      onGenerateInitialRoutes: (String initialRouteName) {
        if (initialMessage != null) {
          return [
            MaterialPageRoute(
              builder: (context) => Home(initialMessage: initialMessage),
            ),
            MaterialPageRoute(
              builder: (context) => NbaSdk.activityDetails(),
            ),
          ];
        }
        return [
          MaterialPageRoute(
            builder: (context) => Home(initialMessage: initialMessage),
          ),
        ];
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key, this.initialMessage});

  final RemoteMessage? initialMessage;

  Widget _getAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.black
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/wr.svg', width: 22, height: 22),
          Gap(10),
          Text('Next Best Actions', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
          Spacer(),
          NotificationWidget(onNotificationIconPressed: () {
            Navigator.pushNamed(context, '/notifications');
          }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, title: _getAppBar(context)),
      body: NbaSdk.home(),
    );
  }
}
