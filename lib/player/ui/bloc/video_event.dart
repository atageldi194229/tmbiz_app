part of 'video_bloc.dart';

sealed class VideoEvent extends Equatable {
  const VideoEvent();

  @override
  List<Object> get props => [];
}

final class VideoPlayRequested extends VideoEvent {}

final class VideoStopRequested extends VideoEvent {}
