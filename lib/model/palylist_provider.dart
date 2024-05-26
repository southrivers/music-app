import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:music/model/song.dart';

class PlaylistProvider extends GetxController {
  RxList<Song> playList = <Song>[
    Song(
      songName: "爱江山更爱美人",
      artistName: "李丽芬",
      imagePath: "assets/image/login.jpg",
      audioPath: "audio/ajs.mp3",
    ),
    Song(
      songName: "得意的笑",
      artistName: "李丽芬",
      imagePath: "assets/image/login.jpg",
      audioPath: "audio/dydx.mp3",
    )
  ].obs;

  var _currentIndex = 0.obs;

  void changeIndex(int value) {
    _currentIndex.value = value;
  }

  int get currentIndex => _currentIndex.value;

  AudioPlayer audioPlayer = AudioPlayer();

/**
 * 用于播放或者暂停
 */
  Future<void> playAudio() async {
    if (isPlay.value) {
      await audioPlayer.play(AssetSource(playList[currentIndex].audioPath));
    } else {
      await audioPlayer.pause();
    }
    isPlay.value = !isPlay.value;
  }

  var isPlay = true.obs;

  Future<void> pre() async {
    isPlay.value = false;
    _currentIndex.value++;
    if (currentIndex >= playList.length) {
      _currentIndex.value = 0;
    }
    await audioPlayer.play(AssetSource(playList[currentIndex].audioPath));
  }

  Future<void> next() async {
    isPlay.value = false;
    _currentIndex.value--;
    if (currentIndex < 0) {
      _currentIndex.value = playList.length - 1;
    }
    await audioPlayer.play(AssetSource(playList[currentIndex].audioPath));
  }

  var duration = Duration(seconds: 0).obs;

  var currentDuration = Duration(seconds: 0).obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    audioPlayer.onDurationChanged.listen((event) {
      duration.value = event;
    });
    // 这里才是更新position的地方
    audioPlayer.onPositionChanged.listen((event) {
      currentDuration.value = event;
    });
  }
}
