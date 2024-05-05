// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'video_player_bloc.dart';

enum VideoPlayerStatus {
  idle,
  loading,
  populated,
  failure,

  playing,
  paused,
}

class VideoPlayerState extends Equatable {
  const VideoPlayerState({
    required this.status,
    this.videos = const [],
  });

  const VideoPlayerState.initial() : this(status: VideoPlayerStatus.idle);

  final VideoPlayerStatus status;
  final List<String> videos;

  @override
  List<Object?> get props => [status, videos];

  VideoPlayerState copyWith({
    VideoPlayerStatus? status,
    List<String>? videos,
  }) {
    return VideoPlayerState(
      status: status ?? this.status,
      videos: videos ?? this.videos,
    );
  }
}
