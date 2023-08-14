import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lesson_afb_5/models/playlist_model.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  Playlist playlist = Get.arguments ?? Playlist.playlists[0];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.deepPurple.shade800.withOpacity(0.8),
              Colors.deepPurple.shade300.withOpacity(0.8),
            ])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.all(5.0),
                child: IconButton(
                  onPressed: () => Get.toNamed('/'),
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                ),
              ),
              title: const Text("Playlist"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _PlaylistInfo(playlist: playlist),
                    const SizedBox(
                      height: 30,
                    ),
                    const _PlayOrShuffleSwitch(),
                    _PlaylistSongs(playlist: playlist)
                  ],
                ),
              ),
            )
          )
        );
  }
}

class _PlaylistSongs extends StatelessWidget {
  const _PlaylistSongs({
    super.key,
    required this.playlist,
  });

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: playlist.songs.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(
            '${index + 1}',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          title: Text(
            playlist.songs[index].title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          subtitle: Text(
            '${playlist.songs[index].description}  ◎  2:45'
          ),
          trailing: const Icon(Icons.more_vert, color: Colors.white,),
        );
      },
    );
  }
}

class _PlayOrShuffleSwitch extends StatefulWidget {
  const _PlayOrShuffleSwitch({
    Key? key,
  }) : super(key: key);

  @override
  State<_PlayOrShuffleSwitch> createState() => _PlayOrShuffleSwitchState();
}

class _PlayOrShuffleSwitchState extends State<_PlayOrShuffleSwitch> {
  bool isPlay = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          isPlay = !isPlay;
        });
      },
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 100),
            left: isPlay ? 0 : width * 0.45,
            child: Container(
              height: 50,
              width: width * 0.45,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade400,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Play',
                        style: TextStyle(
                            color: isPlay ? Colors.white : Colors.deepPurple,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      Icons.play_circle,
                      color: isPlay ? Colors.white : Colors.deepPurple,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Shuffle',
                        style: TextStyle(
                            color: isPlay ? Colors.deepPurple : Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      Icons.shuffle,
                      color: isPlay ? Colors.deepPurple : Colors.white,
                    )
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class _PlaylistInfo extends StatelessWidget {
  const _PlaylistInfo({
    super.key,
    required this.playlist,
  });

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Image.asset(
            playlist.imageUrl,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.height * 0.3,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          playlist.title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
