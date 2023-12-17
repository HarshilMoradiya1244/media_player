import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import '../../../utils/colors.dart';
import '../provider/video_provider.dart';

class VideoPLayerScreen extends StatefulWidget {
  const VideoPLayerScreen({super.key});

  @override
  State<VideoPLayerScreen> createState() => _VideoPLayerScreenState();
}

class _VideoPLayerScreenState extends State<VideoPLayerScreen> {
  VideoPlayerController? videoPlayerController;
  ChewieController? controller;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
    VideoPlayerController.asset("${context.read<VideoProvider>().VideoList[context.read<VideoProvider>().index].video}")
      ..initialize().then((value) {
        setState(() {});
      });
    controller = ChewieController(videoPlayerController: videoPlayerController!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: green,
          title: const Column(
            children: [
              Text(
                "PLAYING FROM YOUR PLAYLIST",
                style: TextStyle(fontSize: 11, letterSpacing: 2),
              ),
              Text(
                "Liked Songs",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
            ],
          ),
          centerTitle: true,
          actions: const [
            Icon(
              Icons.more_vert,
              color: Colors.black,
            )
          ],
        ),
        backgroundColor: black,
        body: Center(
          child: SizedBox(
            height: 200,
            width: double.infinity,
            child: Chewie(controller: controller!,),
          ),
        ),
      ),
    );
  }
}