import 'package:newa_folk_lyrics/src/modules/song/data/model/compact_song_response.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/view_models/song_view_model.dart';

class SongAdapter {
  SongViewModel convert(CompactSongResponse song) {
    return SongViewModel(
      name: song.name,
      singer: song.singer,
      image: song.thumbnailLink,
    );
  }
}
