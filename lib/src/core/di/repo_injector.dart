import 'package:newa_folk_lyrics/src/core/di/locator.dart';
import 'package:newa_folk_lyrics/src/modules/song/data/repo/content_repo.dart';
import 'package:newa_folk_lyrics/src/modules/song/data/repo/lyrics_repo.dart';

void injectRepo() {
  g.registerLazySingleton(() => ContentRepo(dio: g()));
  g.registerLazySingleton(() => LyricsRepo(dio: g()));
}
