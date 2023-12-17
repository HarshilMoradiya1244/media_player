import 'package:flutter/material.dart';
import 'package:media_player/screen/video/model/video_model.dart';

class VideoProvider with ChangeNotifier {

  int index = 0;

  List<VideoModel> VideoList = [
    VideoModel(
        title: "Arjan Vally",
        image: "assets/images/img1.jpg",
        video: "assets/video/video1.mp4"),
    VideoModel(
        title: "Jamal Kudu",
        image: "assets/images/img2.jpg",
        video: "assets/video/video2.mp4"),
    VideoModel(
        title: "Papa Meri jaan",
        image: "assets/images/img3.jpg",
        video: "assets/video/video3.mp4"),
    VideoModel(
        title: "Pehle Bhi Main",
        image: "assets/images/img4.jpg",
        video: "assets/video/video4.mp4"),
  ];


  void changIndex(int i) {
    index = i;
    notifyListeners();
  }
}