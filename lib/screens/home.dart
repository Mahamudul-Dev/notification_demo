import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification_demo/controllers/home_controller.dart';
import 'package:notification_demo/controllers/notification_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) async {
        print("FirebaseMessaging.instance.getInitialMessage");
      },
    );
    FirebaseMessaging.onMessage.listen(
      (message) async {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          log(message.notification!.title!);
          log(message.notification!.body!);
          log("message.data11 ${message.data}");}
           LocalNotificationService.createanddisplaynotification(message);
          });
         
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.appTitle),
      ),
      body: Center(
        child: ElevatedButton(onPressed: ()async{
          String? token = await FirebaseMessaging.instance.getToken();
          log(token!);
        }, child: Text('Get Token')),
      ),
    );
  }
}

//now it is ready you can send meesage notification from firebase