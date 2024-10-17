import 'package:get/get.dart';

class PlatformController extends GetxController {
  // Initial platform is set to Android (true means Android, false means iOS)
  var isAndroid = true.obs;

  // Method to toggle platform
  void togglePlatform(bool value) {
    isAndroid.value = value;
  }
}