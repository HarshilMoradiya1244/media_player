import 'package:flutter/material.dart';
import 'package:media_player/screen/video/provider/video_provider.dart';
import 'package:provider/provider.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoProvider? providerr;
  VideoProvider? providerw;
  @override
  Widget build(BuildContext context) {
    providerr = context.read<VideoProvider>();
    providerw = context.watch<VideoProvider>();
    return ListView.builder(
      itemCount: providerw!.VideoList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            onTap: () {
              providerr!.changIndex(index);
              Navigator.pushNamed(context, 'video_Player');
            },
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "${providerw!.VideoList[index].image}",
                height: 80,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              "${providerw!.VideoList[index].title}",
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}