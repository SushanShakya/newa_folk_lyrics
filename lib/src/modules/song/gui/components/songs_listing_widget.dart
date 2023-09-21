// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:newa_folk_lyrics/src/modules/common/gui/components/tap_effect.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/components/song_widget.dart';

import 'package:newa_folk_lyrics/src/modules/song/gui/view_models/song_view_model.dart';

class SongsListingWidget extends StatelessWidget {
  final List<SongViewModel> songs;
  final void Function(int)? onTap;

  const SongsListingWidget({
    Key? key,
    required this.songs,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        songs.length,
        (i) => Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: TapEffect(
            onTap: onTap != null ? () => onTap!(i) : () {},
            child: SongWidget(model: songs[i]),
          ),
        ),
      ),
    );
  }
}
