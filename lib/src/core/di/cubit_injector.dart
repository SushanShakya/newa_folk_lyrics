import 'package:newa_folk_lyrics/src/core/di/locator.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/cubits/content_cubit.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/cubits/lyrics_cubit.dart';

void injectCubits() {
  g.registerLazySingleton(() => ContentCubit(interactor: g()));
  g.registerLazySingleton(() => LyricsCubit(interactor: g()));
}
