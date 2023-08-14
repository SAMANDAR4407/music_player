import 'package:flutter/material.dart';
import 'package:lesson_afb_5/models/playlist_model.dart';
import 'package:lesson_afb_5/models/song_model.dart';

import '../widgets/playlist_card.dart';
import '../widgets/section_header.dart';
import '../widgets/song_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;
    List<Playlist> playlists = Playlist.playlists;

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
        appBar: const _CustomAppBar(),
        bottomNavigationBar: const _CustomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const _DiscoverMusic(),
              _TrendingMusic(songs: songs),
              _PlayListMusic(playlists: playlists)
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.deepPurple.shade800.withOpacity(0.95),
          child: ListView(
            children:  [
              const UserAccountsDrawerHeader(currentAccountPicture: CircleAvatar(child: FlutterLogo(size: 42)),accountName: Text('Samandar Kamalov'), accountEmail: Text('samwilson4407@gmail.com')),
              InkWell(onTap: (){},child: const ListTile(leading: Icon(Icons.person, color: Colors.white,), title: Text('Samandar Kamalov', style: TextStyle(color: Colors.white),),)),
              const Divider(thickness: 2),
              InkWell(onTap: (){},child: const ListTile(leading: Icon(Icons.code, color: Colors.white,), title: Text('Hello world', style: TextStyle(color: Colors.white),),)),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlayListMusic extends StatelessWidget {
  const _PlayListMusic({
    super.key,
    required this.playlists,
  });

  final List<Playlist> playlists;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SectionHeader(title: 'Playlists'),
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 20),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: playlists.length,
            itemBuilder: (context, index){
              return PlaylistCard(playlist: playlists[index]);
            },
          )
        ],
      ),
    );
  }
}

class _TrendingMusic extends StatelessWidget {
  const _TrendingMusic({
    super.key,
    required this.songs,
  });

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 20,
        bottom: 20,
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: SectionHeader(title: "Trending Music"),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return SongCard(song: songs[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _DiscoverMusic extends StatelessWidget {
  const _DiscoverMusic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Enjoy your favorite music',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search',
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey.shade400),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade400,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none)),
          ),
        ],
      ),
    );
  }
}

class _CustomNavBar extends StatelessWidget {
  const _CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepPurple.shade800,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: 'FAVORITE'),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline), label: 'PLAY'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_outline), label: 'PROFILE'),
        ]);
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: (){},
        icon: const Icon(
          Icons.grid_view_rounded,
          color: Colors.white,
        ),
      ),
      actions: [
        Tooltip(
          message: 'Profile',
          child: Container(
            margin: const EdgeInsets.only(right: 20),
            child: const CircleAvatar(backgroundColor: Colors.deepPurpleAccent ,child: FlutterLogo())
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
