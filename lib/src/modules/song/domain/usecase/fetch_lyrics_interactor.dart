// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:newa_folk_lyrics/src/modules/common/data/repo/file_storage_repo.dart';
import 'package:newa_folk_lyrics/src/modules/common/data/repo/interface/istorage.dart';
import 'package:newa_folk_lyrics/src/modules/song/data/repo/lyrics_repo.dart';

class FetchLyricsInteractor {
  final LyricsRepo repo;

  FetchLyricsInteractor({
    required this.repo,
  });

  Future<Map<String, dynamic>> fetchFromNet(String filename) async {
    final store = FileStorageRepo(filename: filename);
    final lyrics = await repo.fetchLyrics(filename);
    await store.save(jsonEncode(lyrics));
    return lyrics;
  }

  Future<Map<String, dynamic>?> fetchFromDb(IStorage storage) async {
    final res = await storage.fetch();
    if (res == null) return null;
    return jsonDecode(res);
  }

  Future<Map<String, dynamic>> fetchLyrics(String filename) async {
    final store = FileStorageRepo(filename: filename);
    final res = await fetchFromDb(store);
    if (res != null) return res;
    print('----- ERE');
    return fetchFromNet(filename);
  }
}
