import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/model/palylist_provider.dart';
import 'package:music/model/song.dart';
import 'package:music/pages/song_page.dart';

class NeuBox extends GetView<PlaylistProvider> {
  const NeuBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.background,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 24),
        child: Obx(
          () {
            var playList = controller.playList.value;
            return ListView.builder(
              itemBuilder: (context, index) {
                Song song = playList[index];
                return ListTile(
                  title: Text(song.songName),
                  subtitle: Text(song.artistName),
                  leading: Image.asset(song.imagePath),
                  onTap: () {
                    controller.changeIndex(index);
                    Get.to(SongPage());
                  },
                );
              },
              itemCount: playList.length,
            );
          },
        ),
      ),
    );
  }
}
