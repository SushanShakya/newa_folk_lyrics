import 'package:newa_folk_lyrics/src/core/di/locator.dart';
import 'package:newa_folk_lyrics/src/modules/song/domain/usecase/fetch_content_interactor.dart';
import 'package:newa_folk_lyrics/src/modules/song/domain/usecase/fetch_lyrics_interactor.dart';

void injectInteractors() {
  g.registerLazySingleton(() => FetchContentInteractor(repo: g()));
  g.registerLazySingleton(() => FetchLyricsInteractor(repo: g()));
}
