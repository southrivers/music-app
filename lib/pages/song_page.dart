import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/model/palylist_provider.dart';
import 'package:music/model/song.dart';

class SongPage extends GetView<PlaylistProvider> {
  const SongPage({Key? key}) : super(key: key);

  String formatTime(Duration duration) {
    return "${duration.inMinutes}:${duration.inSeconds.remainder(60).toString()}";
  }

  @override
  Widget build(BuildContext context) {
    Song song = controller.playList[controller.currentIndex];
    return Scaffold(
        backgroundColor: Get.theme.colorScheme.background,
        body: Obx(() {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.arrow_back)),
                      Text("歌曲"),
                      IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Get.theme.colorScheme.background,
                        blurRadius: 15,
                        offset: Offset(4, 4),
                      ),
                      BoxShadow(
                        color: Get.theme.colorScheme.background,
                        blurRadius: 15,
                        offset: Offset(-4, -4),
                      )
                    ]),
                    child: Column(
                      children: [
                        ClipRect(
                          child: Image.asset(song.imagePath),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  song.songName,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Get.theme.colorScheme.inversePrimary,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  song.artistName,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Get.theme.colorScheme.inversePrimary,
                                  ),
                                ),
                              ],
                            ),
                            Icon(Icons.favorite),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatTime(controller.currentDuration.value),
                        style: TextStyle(
                          color: Get.theme.colorScheme.inversePrimary,
                        ),
                      ),
                      Icon(Icons.shuffle),
                      Icon(Icons.repeat),
                      Text(
                        formatTime(controller.duration.value),
                        style: TextStyle(
                          color: Get.theme.colorScheme.inversePrimary,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Slider(
                    min: 0,
                    max: controller.duration.value.inSeconds.toDouble(),
                    value:
                        controller.currentDuration.value.inSeconds.toDouble(),
                    activeColor: Colors.amber,
                    onChanged: (value) {},
                    onChangeEnd: (value) {
                      controller.audioPlayer.seek(
                        Duration(
                          seconds: value.toInt(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Get.theme.colorScheme.inversePrimary
                              .withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(8),
                        child: IconButton(
                          onPressed: () async {
                            controller.pre();
                            Get.forceAppUpdate();
                          },
                          icon: Icon(
                            Icons.skip_previous,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Get.theme.colorScheme.inversePrimary
                              .withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(8),
                        child: IconButton(
                          onPressed: () async {
                            await controller.playAudio();
                          },
                          icon: Icon(
                            controller.isPlay.value
                                ? Icons.play_arrow
                                : Icons.pause,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Get.theme.colorScheme.inversePrimary
                              .withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(8),
                        child: IconButton(
                          onPressed: () async {
                            controller.next();
                            Get.forceAppUpdate();
                          },
                          icon: Icon(
                            Icons.skip_next,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }));
  }
}
