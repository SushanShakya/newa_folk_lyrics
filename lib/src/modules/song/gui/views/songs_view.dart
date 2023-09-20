import 'package:flutter/material.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/components/song_widget.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/view_models/song_view_model.dart';

class SongsView extends StatelessWidget {
  const SongsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              "https://media.fuzia.com/assets/uploads/images/co_brand_1/article/2016/Matina.jpeg",
              fit: BoxFit.cover,
              alignment: Alignment.topLeft,
            ),
          ),
          Positioned.fill(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const SizedBox(height: 300),
                const Text(
                  "Newa Folk\nLyrics",
                  style: TextStyle(
                    fontFamily: "Alba",
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    shadows: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 10,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                SongWidget(
                  model: SongViewModel(
                    name: "Rajamati Kumati",
                    singer: "Shrestha",
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
