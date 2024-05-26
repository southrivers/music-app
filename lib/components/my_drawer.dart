import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/pages/setting_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Get.theme.colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.music_note,
                size: 40,
                color: Get.theme.colorScheme.primary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              title: Text(
                "主页",
                style: TextStyle(
                  color: Get.theme.colorScheme.primary,
                ),
              ),
              leading: Icon(Icons.home, color: Get.theme.colorScheme.primary),
              onTap: () {
                Get.back();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              leading:
                  Icon(Icons.settings, color: Get.theme.colorScheme.primary),
              title: Text(
                "设置",
                style: TextStyle(
                  color: Get.theme.colorScheme.primary,
                ),
              ),
              onTap: () {
                Get.to(SettingsPage());
              },
            ),
          )
        ],
      ),
    );
  }
}
