import 'dart:convert';

class SongResponse {
  final String name;
  final String youtubeHash;
  final String thumbnail;
  final List<SongLyrics> lyrics;

  SongResponse({
    required this.name,
    required this.youtubeHash,
    required this.thumbnail,
    required this.lyrics,
  });

  String? get thumbnailLink {
    if (thumbnail != "") return thumbnail;
    if (youtubeHash == "") return null;
    return "https://img.youtube.com/vi/$youtubeHash/0.jpg";
  }

  SongResponse copyWith({
    String? name,
    String? youtubeHash,
    String? thumbnail,
    List<SongLyrics>? lyrics,
  }) =>
      SongResponse(
        name: name ?? this.name,
        youtubeHash: youtubeHash ?? this.youtubeHash,
        thumbnail: thumbnail ?? this.thumbnail,
        lyrics: lyrics ?? this.lyrics,
      );

  factory SongResponse.fromJson(String str) =>
      SongResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SongResponse.fromMap(Map<String, dynamic> json) => SongResponse(
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
  final List<Verse> lyrics;

  SongLyrics({
    required this.type,
    required this.lyrics,
  });

  SongLyrics copyWith({
    String? type,
    List<Verse>? lyrics,
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
        lyrics: List<Verse>.from(json["lyrics"].map((x) => Verse.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "lyrics": List<dynamic>.from(lyrics.map((x) => x.toMap())),
      };
}

class Verse {
  final String name;
  final List<String> lyrics;

  Verse({
    required this.name,
    required this.lyrics,
  });

  Verse copyWith({
    String? name,
    List<String>? lyrics,
  }) =>
      Verse(
        name: name ?? this.name,
        lyrics: lyrics ?? this.lyrics,
      );

  factory Verse.fromJson(String str) => Verse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Verse.fromMap(Map<String, dynamic> json) => Verse(
        name: json["name"],
        lyrics: List<String>.from(json["lyrics"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "lyrics": List<dynamic>.from(lyrics.map((x) => x)),
      };
}
