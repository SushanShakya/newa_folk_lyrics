// ignore_for_file: public_member_api_docs, sort_constructors_first
class SongViewModel {
  final String name;
  final String singer;
  final String? image;

  SongViewModel({
    required this.name,
    required this.singer,
    this.image,
  });
}
