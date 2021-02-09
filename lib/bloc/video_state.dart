part of 'video_bloc.dart';

abstract class VideoState extends Equatable {
  const VideoState();
  
  @override
  List<Object> get props => [];
}

class VideoMovieInitial extends VideoState {}

class VideoLoaded extends VideoState {
  final List<VideoData> videos;
  VideoLoaded(this.videos);
  @override
  List<Object> get props => [videos];
}

class VideoFailed extends VideoState {
  final String msg;
  VideoFailed(this.msg);
  @override
  List<Object> get props => [msg];
}

