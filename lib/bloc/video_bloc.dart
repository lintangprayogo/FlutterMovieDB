import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_db_app/model/models.dart';
import 'package:movie_db_app/services/services.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoMovieBloc extends Bloc<VideoMovieEvent, VideoState> {
  VideoMovieBloc() : super(VideoMovieInitial());

  @override
  Stream<VideoState> mapEventToState(
    VideoMovieEvent event,
  ) async* {
    if (event is GetVideo) {
      BaseApiResponse<List<VideoData>> result =
          await VideoService.getVideos(event.kind, event.movieId);
      if (result.value == null) {
        yield VideoFailed(result.msg);
      } else {
        yield VideoLoaded(result.value);
      }
    }
  }
}
