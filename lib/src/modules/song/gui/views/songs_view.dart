import 'package:flutter/material.dart';
import 'package:newa_folk_lyrics/src/core/di/locator.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/adapter/song_adapter.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/components/songs_listing_widget.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/cubits/content_cubit.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/views/lyrics_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warped_bloc/defaults/default_builder.dart';
import 'package:warped_bloc/states/state.dart';

class SongsView extends StatelessWidget {
  const SongsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => g<ContentCubit>(),
      child: const SongsBody(),
    );
  }
}

class SongsBody extends StatelessWidget {
  const SongsBody({super.key});

  Widget buildBackground(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/matina.jpeg",
            fit: BoxFit.cover,
            alignment: Alignment.topLeft,
          ),
        ),
        Container(
          color: Colors.white.withOpacity(0.4),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final adapter = SongAdapter();
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: buildBackground(context)),
          Positioned.fill(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const SizedBox(height: 300),
                Text(
                  "Newa Folk\nLyrics",
                  style: TextStyle(
                    fontFamily: "Londrina",
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    shadows: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: 10,
                        offset: const Offset(5, 5),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                BlocBuilder<ContentCubit, BlocState>(
                  builder: defaultBuilder<ContentLoaded, void>(onData: (state) {
                    return SongsListingWidget(
                      onTap: (i) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (c) => LyricsView(song: state.data[i]),
                          ),
                        );
                      },
                      songs: List.generate(
                        state.data.length,
                        (i) => adapter.convert(state.data[i]),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
