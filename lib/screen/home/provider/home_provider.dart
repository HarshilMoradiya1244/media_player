import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../model/home_model.dart';

class MusicProvider with ChangeNotifier {

  bool isPlay = false;
  Duration totalDuration = const Duration(seconds: 0);
  int index = 0;

  AssetsAudioPlayer player = AssetsAudioPlayer();


  List<HomeModel> musicList = [
    HomeModel(
        image: "assets/images/img1.jpg",
        music: "assets/music/music1.mp3",
        title: "Arjan Vally",
      subtitle: "Manan Bhardwaj , Bhupinder Babal",
    ),

    HomeModel(
        image: "assets/images/img2.jpg",
        music: "assets/music/music2.mp3",
        title: "Jamal Kudu",
      subtitle: "HarshVardhan Rameshwar , Choir",
    ),
    HomeModel(
        image: "assets/images/img3.jpg",
        music: "assets/music/music3.mp3",
        title: "Papa Meri Jaan",
      subtitle: " Sonu Nigam , HarshVardhan Rameshwar",
    ),
    HomeModel(
        image: "assets""/images/img4.jpg",
        music: "assets/music/music4.mp3",
        title: "Pehle Bhi Main",
      subtitle: "Vishal Mishra , Raj Shekhar",

    ),
  ];


  void changIndex(int i) {
    index = i;
    notifyListeners();
  }

  void changTotalDuration(Duration d1) {
    totalDuration = d1;
    notifyListeners();
  }

  void changeStatus(bool status) {
    isPlay = status;
    notifyListeners();
  }
}