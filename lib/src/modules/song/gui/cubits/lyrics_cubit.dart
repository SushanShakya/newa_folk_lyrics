// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:warped_bloc/cubit/async_cubit.dart';
import 'package:warped_bloc/states/state.dart';

import 'package:newa_folk_lyrics/src/modules/song/data/model/song_response.dart';
import 'package:newa_folk_lyrics/src/modules/song/domain/usecase/fetch_lyrics_interactor.dart';

class LyricsLoaded extends DataState<SongResponse> {
  const LyricsLoaded({required super.data});
}

class LyricsCubit extends AsyncCubit {
  final FetchLyricsInteractor interactor;

  LyricsCubit({
    required this.interactor,
  });

  fetchLyrics(String filename) async {
    handleDefaultStates(() async {
      final lyrics = await interactor.fetchLyrics(filename);
      emit(LyricsLoaded(data: SongResponse.fromMap(lyrics)));
    });
  }

  forceFetchLyrics(String filename) async {
    handleDefaultStates(() async {
      final lyrics = await interactor.fetchFromNet(filename);
      emit(LyricsLoaded(data: SongResponse.fromMap(lyrics)));
    });
  }
}
