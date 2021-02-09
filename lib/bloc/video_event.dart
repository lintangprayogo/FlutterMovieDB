part of 'video_bloc.dart';

abstract class VideoMovieEvent extends Equatable {
  const VideoMovieEvent();

  @override
  List<Object> get props => [];
}

class GetVideo extends VideoMovieEvent {
  final int movieId;
  final String kind;
  GetVideo(this.kind, this.movieId);
  @override
  List<Object> get props => [movieId, kind];
}
