import 'song_model.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({
    required this.title,
    required this.songs,
    required this.imageUrl,
  });

  static List<Playlist> playlists = [
    
    Playlist(
      title: 'Starred',
      songs: Song.songs,
      imageUrl:
          'assets/images/ccc.png',
    ),
    Playlist(
      title: 'Hip-hop R&B Mix',
      songs: Song.songs,
      imageUrl:
          'assets/images/credit_card.png',
    ),
    Playlist(
      title: 'Rock & Roll',
      songs: Song.songs,
      imageUrl:
          'assets/images/gita_logo.jpg',
    ),
    Playlist(
      title: 'Techno',
      songs: Song.songs,
      imageUrl:
          'assets/images/avatar.png',
    )
  ];
}