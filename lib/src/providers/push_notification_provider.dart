import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
//cUuBceAOQDqlltYQP_fwAw:APA91bHujBSq-XAaMuBcyvzibTTv16U6qcYG210GbdUeKz3Ae4hUGbedwUeLg66TYRtTB5dDY8SysRrJ0YHMLWY0-GymwDRvLzMkTAiXVJqFQ7KqIuymLbVZpEP8StHetzTWTr068ASU
class PushNotificationProvider {

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _messageStreamController = StreamController<String>.broadcast();

  Stream<String> get messagesStream => _messageStreamController.stream;

  static Future<dynamic> onBackgroundMessage(Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    // Or do other work.
  }

  initNotifications() async {

    await _firebaseMessaging.requestNotificationPermissions();
    final token = await _firebaseMessaging.getToken();
    print('fcm token: $token');

    _firebaseMessaging.configure(
      onMessage: onMessage,
      onBackgroundMessage: onBackgroundMessage,
      onLaunch: onLaunch,
      onResume: onResume,
    );
  }

  Future<dynamic> onMessage(Map<String, dynamic> message) async {
    print('===ON MESSAGE===');
    final arg = message['data']['message'] ?? 'no-data';
    _messageStreamController.sink.add(arg);

  }
  Future<dynamic> onLaunch(Map<String, dynamic> message) async {
    print('===ON LAUNCH===');
    final arg = message['data']['message'] ?? 'no-data';
    _messageStreamController.sink.add(arg);

  }
  Future<dynamic> onResume(Map<String, dynamic> message) async {
    print('===ON RESUME===');
    final arg = message['data']['message'] ?? 'no-data';
    _messageStreamController.sink.add(arg);

  }

  dispose() {
    _messageStreamController?.close();
  }
}