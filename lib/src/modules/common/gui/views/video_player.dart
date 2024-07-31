// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  final String videoId;
  const VideoPlayer({
    Key? key,
    required this.videoId,
  }) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _controller;
  late PlayerState _playerState;

  PlayerState get playerState => _playerState;
  void setPlayerState(bool value) {
    _isPlayerReady = value;
  }

//  YoutubeMetaData _videoMetaData;
  // double _volume = 100;
  // bool _muted = false;
  bool _isPlayerReady = false;

  void onReady() {
    _controller.addListener(listener);
  }

  void initiateYT() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  void listener() {
    if (_isPlayerReady && !_controller.value.isFullScreen) {
      _playerState = _controller.value.playerState;
    }
  }

  void willPop() {
    _controller.pause();
  }

  void onDispose() {
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    initiateYT();
  }

  @override
  void dispose() {
    super.dispose();
    onDispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      onReady: onReady,
      topActions: <Widget>[
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            _controller.metadata.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
