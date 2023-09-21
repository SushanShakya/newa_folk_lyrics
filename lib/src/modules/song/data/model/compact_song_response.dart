import 'dart:convert';

class CompactSongResponse {
  final String name;
  final String thumbnail;
  final String singer;
  final String filename;
  final String youtubeHash;

  CompactSongResponse({
    required this.name,
    required this.thumbnail,
    required this.singer,
    required this.filename,
    required this.youtubeHash,
  });

  String? get thumbnailLink {
    if (thumbnail != "") return thumbnail;
    if (youtubeHash == "") return null;
    return "https://img.youtube.com/vi/$youtubeHash/0.jpg";
  }

  CompactSongResponse copyWith({
    String? name,
    String? thumbnail,
    String? singer,
    String? filename,
    String? youtubeHash,
  }) =>
      CompactSongResponse(
        name: name ?? this.name,
        thumbnail: thumbnail ?? this.thumbnail,
        singer: singer ?? this.singer,
        filename: filename ?? this.filename,
        youtubeHash: youtubeHash ?? this.youtubeHash,
      );

  factory CompactSongResponse.fromJson(String str) =>
      CompactSongResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CompactSongResponse.fromMap(Map<String, dynamic> json) =>
      CompactSongResponse(
        name: json["name"],
        thumbnail: json["thumbnail"],
        singer: json["singer"],
        filename: json["filename"],
        youtubeHash: json["youtube_hash"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "thumbnail": thumbnail,
        "singer": singer,
        "filename": filename,
        "youtube_hash": youtubeHash,
      };
}
