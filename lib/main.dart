
import 'package:flutter/material.dart';
import 'package:media_player/screen/home/provider/home_provider.dart';
import 'package:media_player/screen/video/provider/video_provider.dart';
import 'package:media_player/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MusicProvider(),),
        ChangeNotifierProvider(create: (context) => VideoProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        routes: app_routes,
      ),
    ),
  );
}