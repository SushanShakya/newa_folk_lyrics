// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:newa_folk_lyrics/src/modules/song/gui/view_models/lyrics_view_model.dart';

class LyricsFragment extends StatelessWidget {
  final List<VerseViewModel> lyrics;

  const LyricsFragment({
    Key? key,
    required this.lyrics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          ...lyrics.map(
            (e) => VerseWidget(
              verse: e,
            ),
          ),
        ],
      ),
    );
  }
}

class VerseWidget extends StatelessWidget {
  final VerseViewModel verse;

  const VerseWidget({
    Key? key,
    required this.verse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Text(
            verse.title,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ...verse.lines.map(
          (e) => Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              e,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}