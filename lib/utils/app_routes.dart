import 'package:flutter/material.dart';
import 'package:media_player/screen/splash/splash_screen.dart';
import 'package:media_player/screen/video/view/video_player_screen.dart';
import 'package:media_player/screen/video/view/video_screen.dart';

import '../screen/home/view/home_screen.dart';
import '../screen/music/view/music_player_screen.dart';

Map<String,WidgetBuilder> app_routes = {
  '/':(context) => const SplashScreen(),
  'home':(context) => const HomeScreen(),
  'music_Player':(context) => const MusicPlayerScreen(),
  'video':(context) => const VideoScreen(),
  'video_Player':(context) => const VideoPLayerScreen(),
};