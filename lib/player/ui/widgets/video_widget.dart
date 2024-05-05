import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({
    Key? key,
    required this.video,
  }) : super(key: key);

  final String video;

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayer;
  late Duration _currentTime;

  bool _isVideoPlaying = true;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.video));
    _initializeVideoPlayer = _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
    _videoPlayerController.play();
    _videoPlayerController.addListener(() {
      setState(() {
        _currentTime = _videoPlayerController.value.position;
      });
    });
    _currentTime = _videoPlayerController.value.position;
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _pausePlayVideo() {
    setState(() {
      _isVideoPlaying ? _videoPlayerController.pause() : _videoPlayerController.play();
      _isVideoPlaying = !_isVideoPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: FutureBuilder(
        future: _initializeVideoPlayer,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GestureDetector(
              onTap: _pausePlayVideo,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerController),
                  ),
                  if (!_isVideoPlaying)
                    IconButton(
                      onPressed: _pausePlayVideo,
                      icon: Icon(
                        Icons.play_arrow,
                        color: Colors.white.withOpacity(0.5),
                        size: 60,
                      ),
                    ),
                  Positioned(
                    bottom: -5,
                    left: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        '${_videoPlayerController.value.position.inMinutes.toString().padLeft(2, '0')}:${(_videoPlayerController.value.position.inSeconds % 60).toString().padLeft(2, '0')}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -5,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        '${(_videoPlayerController.value.duration.inMinutes).toString().padLeft(2, '0')}:${(_videoPlayerController.value.duration.inSeconds % 60).toString().padLeft(2, '0')}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -5,
                    left: 50,
                    right: 50,
                    child: VideoProgressIndicator(
                      _videoPlayerController,
                      allowScrubbing: true,
                      padding: const EdgeInsets.all(8.0),
                      colors: const VideoProgressColors(
                        playedColor: Colors.white,
                        bufferedColor: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
              // child: Lottie.asset(
              //   'assets/taze.json',
              //   width: 100,
              //   height: 100,
              //   fit: BoxFit.cover,
              // ),
            );
          }
        },
      ),
    );
  }
}
