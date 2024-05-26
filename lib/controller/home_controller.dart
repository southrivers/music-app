import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:music/theme/dark_mode.dart';
import 'package:music/theme/light_mode.dart';

class HomeController extends GetxController {
  var isDarkMode = false.obs;

  void changeTheme() {
    isDarkMode.value = !isDarkMode.value;
    // Get可以直接更改主题
    Get.changeTheme(isDarkMode.value ? darkMode : lightMode);
  }
}
