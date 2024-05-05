import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:video_player/video_player.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc({
    required String video,
  }) : super(const VideoState()) {
    final uri = Uri.parse(video);
    controller = VideoPlayerController.networkUrl(uri);
    controller.initialize();

    /// events
    on<VideoPlayRequested>(_onPlayRequested);
  }

  late VideoPlayerController controller;

  FutureOr<void> _onPlayRequested(
    VideoPlayRequested event,
    Emitter<VideoState> emit,
  ) {
    controller.play();
  }
}
