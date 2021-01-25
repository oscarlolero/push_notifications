import 'package:flutter/material.dart';

import 'package:push_notifications/src/pages/home_page.dart';
import 'package:push_notifications/src/pages/message_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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