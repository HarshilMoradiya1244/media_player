import 'package:flutter/material.dart';
import 'package:media_player/screen/video/view/video_screen.dart';
import 'package:provider/provider.dart';
import '../../../utils/colors.dart';
import '../provider/home_provider.dart';
import 'music_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MusicProvider? providerr;
  MusicProvider? providerw;
  @override
  Widget build(BuildContext context) {
    providerr= context.read<MusicProvider>();
    providerw= context.watch<MusicProvider>();
    return  SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: green,
            title: const Text("Music Player"),
            centerTitle: true,
            bottom: const TabBar(
              indicatorColor: Colors.black,
              dividerColor:Colors.black,
              labelColor: Colors.black,
              tabs: [
                Tab(
                  icon: Icon(Icons.music_note_outlined),
                  text: "Music",
                ),
                Tab(
                  icon: Icon(Icons.video_collection_outlined),
                  text: "Video",
                ),
              ],
            ),
          ),
          backgroundColor: black,
          body: const TabBarView(
            children: [
              MusicScreen(),
              VideoScreen(),
            ],
          ),
        ),
      ),
    );
  }
}