import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:video_player/video_player.dart';

part 'video_player_event.dart';
part 'video_player_state.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  VideoPlayerBloc() : super(const VideoPlayerState.initial()) {
    on<VideoPlayerRequested>(_onRequested);
  }

  FutureOr<void> _onRequested(
    VideoPlayerRequested event,
    Emitter<VideoPlayerState> emit,
  ) async {
    try {
      emit(state.copyWith(status: VideoPlayerStatus.loading));

      await Future.delayed(const Duration(seconds: 1));

      final videos = [
        // 'assets/videos/a1.mp4',
        // 'assets/videos/a2.mp4',
        'https://videos.pexels.com/video-files/4828601/4828601-uhd_2160_4096_25fps.mp4',
        'https://videos.pexels.com/video-files/5385341/5385341-uhd_2160_4096_30fps.mp4',
        'https://videos.pexels.com/video-files/4828605/4828605-uhd_4096_2160_25fps.mp4',
      ];

      emit(state.copyWith(
        status: VideoPlayerStatus.populated,
        videos: videos,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: VideoPlayerStatus.failure));
      addError(error, stackTrace);
    }
  }
}
