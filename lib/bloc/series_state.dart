part of 'series_bloc.dart';

abstract class SeriesState extends Equatable {
  const SeriesState();

  @override
  List<Object> get props => [];
}

class SeriesInitial extends SeriesState {}

class SeriesLoaded extends SeriesState {
  final List<SeriesData> serieses;
  SeriesLoaded(this.serieses);
  @override
  List<Object> get props => [serieses];
}
class SeriesFailed extends SeriesState {
  final String msg;
  SeriesFailed(this.msg);
  @override
  List<Object> get props => [msg];
}