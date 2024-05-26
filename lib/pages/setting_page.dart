import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music/controller/home_controller.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeController = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Get.back();
            // 需要加上这个forceAppUpdate才可以实现上一页的主题更新
            Get.forceAppUpdate();
          },
        ),
        title: Text(
          "设置",
          style: TextStyle(
            color: Get.theme.colorScheme.primary,
          ),
        ),
      ),
      body: Obx(() {
        return Container(
          decoration: BoxDecoration(
              color: Get.theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.all(25),
          margin: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("暗黑模式"),
              CupertinoSwitch(
                  value: homeController.isDarkMode.value,
                  onChanged: (value) {
                    homeController.changeTheme();
                  })
            ],
          ),
        );
      }),
    );
  }
}
