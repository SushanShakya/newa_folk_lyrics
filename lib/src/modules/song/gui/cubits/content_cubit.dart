// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:warped_bloc/warped_bloc.dart';

import 'package:newa_folk_lyrics/src/modules/song/data/model/compact_song_response.dart';
import 'package:newa_folk_lyrics/src/modules/song/domain/usecase/fetch_content_interactor.dart';

class ContentLoaded extends DataState<List<CompactSongResponse>> {
  const ContentLoaded({required super.data});
}

class ContentCubit extends AsyncCubit {
  final FetchContentInteractor interactor;

  ContentCubit({
    required this.interactor,
  });

  List<CompactSongResponse> _convert(List content) {
    return content
        .map(
          (e) => CompactSongResponse.fromMap(
            e as Map<String, dynamic>,
          ),
        )
        .toList();
  }

  fetchContent() async {
    handleDefaultStates(() async {
      final content = await interactor.fetchContent();
      emit(ContentLoaded(data: _convert(content)));
    });
  }

  forceFetchContent() async {
    handleDefaultStates(() async {
      final content = await interactor.fetchContentFromNet();
      emit(ContentLoaded(data: _convert(content)));
    });
  }
}
