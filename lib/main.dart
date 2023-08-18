import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:notification_demo/controllers/notification_controller.dart';
import 'package:notification_demo/screens/home.dart';
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async{
  log(message.notification!.title.toString());
}
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  LocalNotificationService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}


//which mac model you have?
// I have mac os 10.15 catalina
//2014 model?
// maybe o

// wait a munite, I am opening my firebase console okk did your phone internet working properly?
// yes

// are you here? yes this error is shown on huwaei devices only o

// but my device brand is Oppo use emulator or check 

// ok, wait a second please okk

//did you integrate firebase correctly?

// yes its the connection error..