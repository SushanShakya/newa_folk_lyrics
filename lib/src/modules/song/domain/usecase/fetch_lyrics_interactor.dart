// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:newa_folk_lyrics/src/modules/common/data/repo/file_storage_repo.dart';
import 'package:newa_folk_lyrics/src/modules/common/data/repo/interface/istorage.dart';
import 'package:newa_folk_lyrics/src/modules/song/data/repo/lyrics_repo.dart';

class FetchLyricsInteractor {
  final LyricsRepo repo;

  FetchLyricsInteractor({
    required this.repo,
  });

  Future<Map<String, dynamic>> _fetchFromNet(String filename) =>
      repo.fetchLyrics(filename);

  Future<Map<String, dynamic>?> _fetchFromDb(IStorage storage) async {
    final res = await storage.fetch();
    return res as Map<String, dynamic>?;
  }

  Future<Map<String, dynamic>> fetchLyrics(String filename) async {
    final store = FileStorageRepo(filename: filename);
    final res = await _fetchFromDb(store);
    if (res != null) return res;

    final lyrics = await _fetchFromNet(filename);
    await store.save(filename);
    return lyrics;
  }
}
