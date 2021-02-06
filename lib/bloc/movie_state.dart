part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoaded extends MovieState {
  final List<MovieData> movies;
  MovieLoaded(this.movies);
  @override
  List<Object> get props => [movies];
}

class MovieFailed extends MovieState {
  final String msg;
  MovieFailed(this.msg);
  @override
  List<Object> get props => [msg];
}
