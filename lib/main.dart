import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lesson_afb_5/pages/home_screen.dart';
import 'package:lesson_afb_5/pages/playlist_screen.dart';
import 'package:lesson_afb_5/pages/song_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(textTheme: Theme.of(context).textTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      )
      ),
      home: const HomeScreen(),
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen(),),
        GetPage(name: '/song', page: () => const SongScreen(),),
        GetPage(name: '/playlist', page: () => const PlaylistScreen(),)
      ],
    );
  }
}
