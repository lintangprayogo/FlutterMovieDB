import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_db_app/model/models.dart';
import 'package:movie_db_app/services/services.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial());

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    if (event is GetMovie) {
      BaseApiResponse<List<MovieData>> result = await MovieService.getMovies();
      if (result.value == null) {
        yield MovieFailed(result.msg);
      } else {
        yield MovieLoaded(result.value);
      }
    }
  }
}
