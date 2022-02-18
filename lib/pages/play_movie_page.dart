import 'package:flutter/material.dart';
import 'package:meedu_player/meedu_player.dart';
import 'package:vortex/theme/color.dart';
import 'package:vortex/util/play_movie_page_json.dart';
import 'package:wakelock/wakelock.dart';
/* import 'package:youtube_player_iframe/youtube_player_iframe.dart'; */

/* VISUALIZAÇÃO DE VÍDEOS COM O YOUTUBE */

/* class CustomYoutubPlayer extends StatefulWidget {
  final String youtubeURL;
  const CustomYoutubPlayer(this.youtubeURL);

  @override
  _CustomYoutubPlayerState createState() => _CustomYoutubPlayerState();
}

class _CustomYoutubPlayerState extends State<CustomYoutubPlayer> {
  late YoutubePlayerController _controller;

  @override
  Void initState() {
    _controller = YoutubePlayerController.convertUrlToId(widget.youtubeURL!)!,
    params: const YoutubePlayerParams(
      loop: true,
      color: 'transparent',
      desktopMode: true,
      strictRelatedVideos: true,
      showFullscreenButton: !kIsWeb,
    ));
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: kIsWeb ? screenSize.height,
    );
  }
} */

/* VISUALIZAÇÃO DE VÍDEOS COM MEEDU_PLAYER */
class PlayMoviePage extends StatefulWidget {
  @override
  _PlayMoviePageState createState() => _PlayMoviePageState();
}

class _PlayMoviePageState extends State<PlayMoviePage> {
  final MeeduPlayerController _meeduPlayerController =
      MeeduPlayerController(colorTheme: red);

  int count = 0;

  @override
  void initState() {
    super.initState();
    // The following line will enable the Android and iOs wakelock
    Wakelock.enable();
    _init();
  }

  _init() async {
    // launch the player in fullscreen mode
    await this._meeduPlayerController.launchAsFullscreen(context,
        dataSource: DataSource(type: DataSourceType.network, source: movieUrl),
        autoplay: true,
        header: header);
  }

  Widget get header {
    return Container(
      child: Row(
        children: [
          IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: white,
              ),
              onPressed: () {
                // turn back
                Navigator.of(context).popUntil((route) => count++ >= 2);
              }),
          Expanded(
              child: Text(
            name,
            style: TextStyle(color: white),
          )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    Wakelock.disable();
    _meeduPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MeeduVideoPlayer(
        controller: _meeduPlayerController,
      ),
    );
  }
}
