import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/components/my_drawer.dart';
import 'package:music/pages/neu_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 获取系统的主体直接使用Get.theme.colorScheme等各种方法就可以了
      backgroundColor: Get.theme.colorScheme.background,
      appBar: AppBar(
        title: Text("主页"),
      ),
      drawer: MyDrawer(),
      body: NeuBox(),
    );
  }
}
