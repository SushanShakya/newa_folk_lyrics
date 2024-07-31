// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newa_folk_lyrics/src/core/di/locator.dart';
import 'package:newa_folk_lyrics/src/modules/common/gui/components/image_component.dart';

import 'package:newa_folk_lyrics/src/modules/song/data/model/compact_song_response.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/adapter/lyrics_adapter.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/cubits/internet_check_cubit.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/cubits/lyrics_cubit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:warped_bloc/defaults/default_builder.dart';
import 'package:warped_bloc/states/state.dart';

import '../../../common/gui/views/video_player.dart';
import 'fragments/lyrics_fragment.dart';

class LyricsView extends StatefulWidget {
  final CompactSongResponse song;

  const LyricsView({
    Key? key,
    required this.song,
  }) : super(key: key);

  @override
  State<LyricsView> createState() => _LyricsViewState();
}

class _LyricsViewState extends State<LyricsView> {
  late LyricsCubit cubit;
  late LyricsAdapter adapter;
  late InternetCheckCubit internetCheckCubit;

  @override
  void initState() {
    super.initState();
    cubit = g()..fetchLyrics(widget.song.filename);
    internetCheckCubit = InternetCheckCubit()..hasNetwork();
    adapter = LyricsAdapter();
  }

  Widget buildBg(BuildContext context) {
    return Hero(
      tag: widget.song.youtubeHash,
      child: ImageComponent.createImage(image: widget.song.thumbnailLink),
    );
  }

  Future<void> onRefresh(BuildContext context) async {
    cubit.forceFetchLyrics(widget.song.filename);
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LyricsCubit, BlocState>(
        bloc: cubit,
        builder: defaultBuilder<LyricsLoaded, void>(onData: (state) {
          final lyricsTypes = state.data.lyrics;
          return DefaultTabController(
            length: lyricsTypes.length,
            child: RefreshIndicator(
              onRefresh: () async {
                cubit.forceFetchLyrics(widget.song.filename);
                await Future.delayed(const Duration(seconds: 1));
              },
              child: SafeArea(
                  child: Column(
                children: [
                  Row(
                    children: [
                      const BackButton(),
                      Expanded(
                        child: Text(
                          widget.song.name,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 50),
                    ],
                  ),
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: BlocBuilder<InternetCheckCubit, bool>(
                      bloc: internetCheckCubit,
                      builder: (context, hasInternet) {
                        if (!hasInternet) {
                          return buildBg(context);
                        }
                        return VideoPlayer(
                          videoId: widget.song.youtubeHash,
                        );
                      },
                    ),
                  ),
                  TabBar(
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                    tabs: lyricsTypes.map((e) => Tab(text: e.type)).toList(),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: lyricsTypes
                          .map(
                            (e) => LyricsFragment(
                              lyrics: e.lyrics
                                  .map(
                                    (e) => adapter.convert(e),
                                  )
                                  .toList(),
                              onRefresh: () => onRefresh(context),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              )),
            ),
          );
        }),
      ),
    );
  }

  launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}
