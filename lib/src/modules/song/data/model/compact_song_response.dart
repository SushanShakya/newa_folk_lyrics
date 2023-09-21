import 'dart:convert';

class CompactSongResponse {
  final String name;
  final String thumbnail;
  final String singer;
  final String filename;

  CompactSongResponse({
    required this.name,
    required this.thumbnail,
    required this.singer,
    required this.filename,
  });

  CompactSongResponse copyWith({
    String? name,
    String? thumbnail,
    String? singer,
    String? filename,
  }) =>
      CompactSongResponse(
        name: name ?? this.name,
        thumbnail: thumbnail ?? this.thumbnail,
        singer: singer ?? this.singer,
        filename: filename ?? this.filename,
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
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "thumbnail": thumbnail,
        "singer": singer,
        "filename": filename,
      };
}
