import 'package:flutter/material.dart';
import 'package:music/controller/home_controller.dart';
import 'package:music/model/palylist_provider.dart';
import 'package:music/pages/home_page.dart';
import 'package:music/theme/dark_mode.dart';
import 'package:music/theme/light_mode.dart';
import 'package:get/get.dart';

void main() {
  Get.put(HomeController());
  Get.put(PlaylistProvider());
  runApp(GetMaterialApp(
    title: "我的音乐",
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    home: HomePage(),
    theme: lightMode,
  ));
}
