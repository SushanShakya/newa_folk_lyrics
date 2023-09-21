import 'package:newa_folk_lyrics/src/modules/song/data/model/song_response.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/view_models/lyrics_view_model.dart';

class LyricsAdapter {
  VerseViewModel convert(Verse verse) {
    return VerseViewModel(
      title: verse.name,
      lines: verse.lyrics,
    );
  }
}
