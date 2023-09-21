// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:newa_folk_lyrics/src/modules/common/data/repo/file_storage_repo.dart';
import 'package:newa_folk_lyrics/src/modules/song/data/repo/content_repo.dart';

class FetchContentInteractor {
  static const filename = "content.json";

  final ContentRepo repo;
  late FileStorageRepo store;

  FetchContentInteractor({
    required this.repo,
  }) {
    store = FileStorageRepo(filename: filename);
  }

  Future<List> fetchContentFromNet() => repo.fetchContent();

  Future<List?> fetchContentFromDb() async {
    final res = await store.fetch();
    if (res == null) return null;
    return jsonDecode(res) as List;
  }

  fetchContent() async {
    final content = await fetchContentFromNet();
    await store.save(jsonEncode(content));
    return content;
  }
}
