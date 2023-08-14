class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
  });

  static List<Song> songs = [
    Song(title: "God's Plan", description: "Drake", url: 'assets/music/drake.mp3', coverUrl: "assets/images/aaa.jpg"),
    Song(title: "I miss the days", description: "NF", url: 'assets/music/nf.mp3', coverUrl: "assets/images/bbb.jpg"),
    Song(title: "Calm Down", description: "Selena Gomez", url: 'assets/music/calm_down.mp3', coverUrl: "assets/images/ccc.png")
  ];
}
