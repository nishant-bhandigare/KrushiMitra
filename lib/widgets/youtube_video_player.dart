import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoPlayer extends StatefulWidget {
  final String videoId;

  const YoutubeVideoPlayer({Key? key, required this.videoId}) : super(key: key);

  @override
  _YoutubeVideoPlayerState createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: true,

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*90,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5)
      ),
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Handle settings button tap
            },
          ),
        ],
        onReady: () {
          // Perform actions when the video is ready
        },
        onEnded: (data) {
          // Perform actions when the video ends
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
