// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newa_folk_lyrics/src/modules/common/gui/components/squircle_border.dart';
import 'package:newa_folk_lyrics/src/modules/common/gui/components/tap_effect.dart';
import 'package:newa_folk_lyrics/src/modules/song/data/model/compact_song_response.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/adapter/song_adapter.dart';

import 'package:newa_folk_lyrics/src/modules/song/gui/components/grid_widget.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/presenters/song_search_cubit.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/view_models/song_view_model.dart';
import 'package:warped_bloc/warped_bloc.dart';

import '../../cubits/content_cubit.dart';
import '../lyrics_view.dart';

class SongsGridFragment extends StatefulWidget {
  const SongsGridFragment({super.key});

  @override
  State<SongsGridFragment> createState() => _SongsGridFragmentState();
}

class _SongsGridFragmentState extends State<SongsGridFragment> {
  late SongSearchCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = SongSearchCubit();
  }

  @override
  Widget build(BuildContext context) {
    final adapter = SongAdapter();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(child: buildBackground(context)),
            Positioned.fill(
              child: Column(
                children: [
                  _buildSearchbar(),
                  Expanded(
                    child: BlocConsumer<ContentCubit, BlocState>(
                      listener: (context, state) {
                        if (state is ContentLoaded) {
                          cubit.updateSongs(state.data);
                        }
                      },
                      builder:
                          defaultBuilder<ContentLoaded, void>(onData: (state) {
                        return BlocBuilder<SongSearchCubit,
                            List<CompactSongResponse>>(
                          bloc: cubit,
                          builder: (context, state) {
                            return SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: GridWidget(
                                  crossCount: 2,
                                  itemCount: state.length,
                                  builder: (c, w, i) {
                                    final data = state[i];
                                    return TapEffect(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (c) => LyricsView(
                                              song: data,
                                            ),
                                          ),
                                        );
                                      },
                                      child: SizedBox(
                                        width: w,
                                        child: SongWidget(
                                          size: w,
                                          tag: data.youtubeHash,
                                          data: adapter.convert(data),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildSearchbar() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        onChanged: cubit.search,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          hintText: "Search Songs",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xfffafafa),
            ),
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 16,
          ),
        ),
      ),
    );
  }

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
        ),
      ],
    );
  }
}

class SongWidget extends StatelessWidget {
  final double size;
  final SongViewModel data;
  final String tag;
  const SongWidget({
    Key? key,
    required this.size,
    required this.data,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: size,
          width: size,
          child: Material(
            shape: SquircleBorder(
              superRadius: 100,
              side: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
            clipBehavior: Clip.hardEdge,
            borderOnForeground: true,
            child: (data.image == null)
                ? null
                : Hero(
                    tag: tag,
                    child: CachedNetworkImage(
                      imageUrl: data.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          data.name,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          data.singer,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
