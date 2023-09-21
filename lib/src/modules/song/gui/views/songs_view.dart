import 'package:flutter/material.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/components/songs_listing_widget.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/view_models/song_view_model.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/views/song_detail_view.dart';

class SongsView extends StatelessWidget {
  const SongsView({super.key});

  Widget buildBackground(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.network(
            "https://media.fuzia.com/assets/uploads/images/co_brand_1/article/2016/Matina.jpeg",
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
                SongsListingWidget(
                  onTap: (i) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (c) => const SongDetailView(),
                      ),
                    );
                  },
                  songs: List.generate(
                    10,
                    (i) => SongViewModel(
                      name: "Rajamati Kumati",
                      singer: "Shrestha",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
