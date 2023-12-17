import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_player/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  MusicProvider? providerr;
  MusicProvider? providerw;

  @override
  void initState() {
    super.initState();
    loadSong();
  }

  void loadSong() {
    context.read<MusicProvider>().player.open(
        Audio(
            "${context.read<MusicProvider>().musicList[context.read<MusicProvider>().index].music}"),
        autoStart: context.read<MusicProvider>().isPlay,
        showNotification: true);

    context.read<MusicProvider>().player.current.listen((event) {
      Duration d1 = event!.audio.duration;
      context.read<MusicProvider>().changTotalDuration(d1);
    });
    liveDuration();
  }

  void liveDuration() {
    context.read<MusicProvider>().player.currentPosition.listen((event) {
      if (context.read<MusicProvider>().player.stopped) {
        context.read<MusicProvider>().changeStatus(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    providerr = context.read<MusicProvider>();
    providerw = context.watch<MusicProvider>();
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "${providerw!.musicList[providerw!.index].image}",
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  width: MediaQuery.sizeOf(context).width * 0.65,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "${providerw!.musicList[providerw!.index].title}",
                style: const TextStyle(color: Colors.white, fontSize: 25),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${providerw!.musicList[providerw!.index].subtitle}",
                style: const TextStyle(color: Colors.white,),
              ),
              const SizedBox(
                height: 20
                ,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      if (providerr!.index > 0) {
                        providerr!.changIndex(--providerr!.index);
                      }
                      loadSong();
                    },
                    icon: const Icon(
                      Icons.skip_previous,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      if (providerr!.isPlay == false) {
                        context.read<MusicProvider>().player.play();
                        providerr!.changeStatus(true);
                      } else {
                        context.read<MusicProvider>().player.pause();
                        providerr!.changeStatus(false);
                      }
                    },
                    icon: Icon(
                      providerw!.isPlay ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      if (providerr!.index < providerr!.musicList.length - 1) {
                        providerr!.changIndex(++providerr!.index);
                      }
                      loadSong();
                    },
                    icon: const Icon(
                      Icons.skip_next,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ],
              ),
              PlayerBuilder.currentPosition(
                  player: context.read<MusicProvider>().player,
                  builder: (context, position) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Slider(
                            min: 0,
                            max: providerr!.totalDuration.inSeconds.toDouble(),
                            value: position.inSeconds.toDouble(),
                            activeColor: Colors.white,
                            onChanged: (value) {
                              context.read<MusicProvider>().player.seek(
                                    Duration(
                                      seconds: value.toInt(),
                                    ),
                                  );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Text(
                                  "${position}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                const Spacer(),
                                Text(
                                  "${providerw!.totalDuration}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.speaker_group,
                                  color: Colors.white,
                                ),
                                Spacer(),
                                Icon(
                                  Icons.share_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.menu_open,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
