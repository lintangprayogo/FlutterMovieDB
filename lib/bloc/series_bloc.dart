import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_db_app/model/models.dart';
import 'package:movie_db_app/services/services.dart';

part 'series_event.dart';
part 'series_state.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  SeriesBloc() : super(SeriesInitial());

  @override
  Stream<SeriesState> mapEventToState(
    SeriesEvent event,
  ) async* {
    if (event is GetSeries) {
      BaseApiResponse<List<SeriesData>> serieses =
          await SeriesService.getSeries();
      if (serieses.value == null) {
        yield SeriesFailed(serieses.msg);
      } else {
        yield SeriesLoaded(serieses.value);
      }
    }
  }
}
