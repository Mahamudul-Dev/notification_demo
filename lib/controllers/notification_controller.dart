
// ignore_for_file: prefer_const_constructors

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

// after this create a method initialize to initialize  localnotification

  static void initialize() {
    // initializationSettings  for Android
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );

    _notificationsPlugin.initialize(
      initializationSettings,
    );
  }
    static void createanddisplaynotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "flutterNotification",
          "flutterNotificationchannel",
          // 'Task',
          // styleInformation:StyleInformation(

          // ),
          // usesChronometer: true,

          importance: Importance.max,
          priority: Priority.high,
          // tag: 'Hassan',/
          // ongoing: true,
          fullScreenIntent: true,
          // autoCancel: false,
          // color: Colors.blue,
          // largeIcon:AndroidBitmap()
          //     'https://th.bing.com/th/id/OIP.hxRValICG6OlXI56NUfSjAHaF1?w=223&h=180&c=7&r=0&o=5&dpr=1.6&pid=1.7',
          // audioAttributesUsage:
          //     AudioAttributesUsage.voiceCommunicationSignalling,
          enableLights: true,

          // colorized: true,
        ),
      );

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );
    } on Exception catch (e) {
      print(e);
    }
  }

}