import 'package:flutter/material.dart';

import 'package:push_notifications/src/pages/home_page.dart';
import 'package:push_notifications/src/pages/message_page.dart';
import 'package:push_notifications/src/providers/push_notification_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    final pushProvider = new PushNotificationProvider();
    pushProvider.initNotifications();

    pushProvider.messagesStream.listen((argument) {
      print('desde main');
      print(argument);
      //video 271
      navigatorKey.currentState.pushNamed('message', arguments: argument);
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext c) => HomePage(),
        'message': (BuildContext c) => MessagePage(),
      },

    );
  }
}