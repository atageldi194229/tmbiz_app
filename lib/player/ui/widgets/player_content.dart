import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmbiz/player/player.dart';

class PlayerContent extends StatelessWidget {
  const PlayerContent({super.key});

  @override
  Widget build(BuildContext context) {
    final videos = context.select((VideoPlayerBloc bloc) => bloc.state.videos);

    if (videos.isEmpty) return const Center(child: CircularProgressIndicator());

    return PageView.builder(
      onPageChanged: (index) {
        // context.read<VideoPlayerBloc>().add(VideoPlayerVideoChanged(index));
      },
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];
        return VideoWidget(video: video);
      },
    );
  }
}
