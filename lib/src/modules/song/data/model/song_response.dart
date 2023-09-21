import 'dart:convert';

class Song {
  final String name;
  final String youtubeHash;
  final String thumbnail;
  final List<SongLyrics> lyrics;

  Song({
    required this.name,
    required this.youtubeHash,
    required this.thumbnail,
    required this.lyrics,
  });

  Song copyWith({
    String? name,
    String? youtubeHash,
    String? thumbnail,
    List<SongLyrics>? lyrics,
  }) =>
      Song(
        name: name ?? this.name,
        youtubeHash: youtubeHash ?? this.youtubeHash,
        thumbnail: thumbnail ?? this.thumbnail,
        lyrics: lyrics ?? this.lyrics,
      );

  factory Song.fromJson(String str) => Song.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Song.fromMap(Map<String, dynamic> json) => Song(
        name: json["name"],
        youtubeHash: json["youtube_hash"],
        thumbnail: json["thumbnail"],
        lyrics: List<SongLyrics>.from(
            json["lyrics"].map((x) => SongLyrics.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "youtube_hash": youtubeHash,
        "thumbnail": thumbnail,
        "lyrics": List<dynamic>.from(lyrics.map((x) => x.toMap())),
      };
}

class SongLyrics {
  final String type;
  final List<Lyrics> lyrics;

  SongLyrics({
    required this.type,
    required this.lyrics,
  });

  SongLyrics copyWith({
    String? type,
    List<Lyrics>? lyrics,
  }) =>
      SongLyrics(
        type: type ?? this.type,
        lyrics: lyrics ?? this.lyrics,
      );

  factory SongLyrics.fromJson(String str) =>
      SongLyrics.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SongLyrics.fromMap(Map<String, dynamic> json) => SongLyrics(
        type: json["type"],
        lyrics: List<Lyrics>.from(json["lyrics"].map((x) => Lyrics.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "lyrics": List<dynamic>.from(lyrics.map((x) => x.toMap())),
      };
}

class Lyrics {
  final String name;
  final List<String> lyrics;

  Lyrics({
    required this.name,
    required this.lyrics,
  });

  Lyrics copyWith({
    String? name,
    List<String>? lyrics,
  }) =>
      Lyrics(
        name: name ?? this.name,
        lyrics: lyrics ?? this.lyrics,
      );

  factory Lyrics.fromJson(String str) => Lyrics.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Lyrics.fromMap(Map<String, dynamic> json) => Lyrics(
        name: json["name"],
        lyrics: List<String>.from(json["lyrics"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "lyrics": List<dynamic>.from(lyrics.map((x) => x)),
      };
}
