// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newa_folk_lyrics/src/core/di/locator.dart';
import 'package:newa_folk_lyrics/src/modules/common/gui/components/image_component.dart';
import 'package:newa_folk_lyrics/src/modules/common/gui/components/tap_effect.dart';
import 'package:newa_folk_lyrics/src/modules/common/gui/views/video_player.dart';

import 'package:newa_folk_lyrics/src/modules/song/data/model/compact_song_response.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/adapter/lyrics_adapter.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/cubits/lyrics_cubit.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/views/fragments/lyrics_fragment.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:warped_bloc/defaults/default_builder.dart';
import 'package:warped_bloc/states/state.dart';

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

  @override
  void initState() {
    super.initState();
    cubit = g()..fetchLyrics(widget.song.filename);
    adapter = LyricsAdapter();
  }

  Widget buildHeaderBackground(BuildContext context) {
    return ImageComponent.createImage(image: widget.song.thumbnailLink);
  }

  Widget buildHeaderObscure(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
          colors: [
            Colors.transparent,
            Colors.white,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height / 2;
    return Scaffold(
      backgroundColor: Colors.white,
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
              child: NestedScrollView(
                headerSliverBuilder: (c, b) {
                  return [
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: h,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: buildHeaderBackground(context),
                            ),
                            Positioned.fill(
                              child: buildHeaderObscure(context),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.song.name,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 24,
                                              ),
                                            ),
                                            Text(
                                              widget.song.singer,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: TapEffect(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        child: Center(
                                          child: VideoPlayer(
                                            videoId: widget.song.youtubeHash,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Center(
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      FontAwesomeIcons.youtube,
                                      size: 50,
                                      color: Color(0xffcd201f),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 48, left: 16),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white,
                                ),
                                child: const BackButton(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      pinned: true,
                      backgroundColor: Colors.white,
                      elevation: 0,
                      title: TabBar(
                        labelColor: Colors.black,
                        tabs:
                            lyricsTypes.map((e) => Tab(text: e.type)).toList(),
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  children: lyricsTypes
                      .map(
                        (e) => LyricsFragment(
                          lyrics: e.lyrics
                              .map(
                                (e) => adapter.convert(e),
                              )
                              .toList(),
                        ),
                      )
                      .toList(),
                ),
              ),
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
