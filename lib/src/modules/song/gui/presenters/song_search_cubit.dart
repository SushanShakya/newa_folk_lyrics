import 'package:newa_folk_lyrics/src/modules/song/data/model/compact_song_response.dart';
import 'package:warped_bloc/warped_bloc.dart';

class SongSearchCubit extends Cubit<List<CompactSongResponse>> {
  SongSearchCubit() : super([]);

  List<CompactSongResponse> _data = [];

  void updateSongs(List<CompactSongResponse> data) {
    _data = data;
    emit(_data);
  }

  void search(String query) {
    if (query.isEmpty) {
      emit(_data);
    }
    emit(_data
        .where((e) => e.name.toLowerCase().contains(query.toLowerCase()))
        .toList());
  }
}
