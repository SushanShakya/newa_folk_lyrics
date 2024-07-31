import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:newa_folk_lyrics/src/core/di/injector.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/views/songs_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  injectDependencies();
  await MobileAds.instance.initialize();
  runApp(const NewaFolkLyricsApp());
}

class NewaFolkLyricsApp extends StatelessWidget {
  const NewaFolkLyricsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Montserrat",
        primaryColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: const SongsView(),
    );
  }
}
