import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newa_folk_lyrics/src/modules/song/gui/views/songs_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(const NewaFolkLyricsApp());
}

class NewaFolkLyricsApp extends StatelessWidget {
  const NewaFolkLyricsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Montserrat",
      ),
      debugShowCheckedModeBanner: false,
      home: const SongsView(),
    );
  }
}
