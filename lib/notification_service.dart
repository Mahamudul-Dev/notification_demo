import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';

class FirebaseNotification {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification()async{
    try {
      // await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    Logger().i('Token: $fCMToken');
    } catch (e) {
      Logger().e(e);
    }
    // FirebaseMessaging.onBackgroundMessage((message) => handleBackgroundMessage(message));
  }

  // Future<void> handleBackgroundMessage(RemoteMessage message) async {
  //   Logger().i('Title: ${message.notification?.title}');
  //   Logger().i('Body: ${message.notification?.body}');
  // }
}

//are you want to show notifications on foreground also?

//ok wait i copy my function for foreground