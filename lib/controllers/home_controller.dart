import 'package:get/get_state_manager/get_state_manager.dart';

import '../notification_service.dart';

class HomeController extends GetxController {
  final String appTitle = 'Push Notification';

  final firebaseNotification = FirebaseNotification();

  @override
  void onInit() {
    firebaseNotification.initNotification();
    super.onInit();
  }
}