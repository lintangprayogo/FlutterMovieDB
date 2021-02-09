part of 'models.dart';

class SeriesData extends Equatable {
  final int id;
  final String posterPath;
  final int runtime;
  final String originalName;
  final String backdropPath;
  final String overview;
  final double vote;
  final String year;
  final String airDate;

  SeriesData(
      {this.id,
      this.backdropPath,
      this.originalName,
      this.posterPath,
      this.runtime,
      this.overview,
      this.vote,
      this.year,
      this.airDate});

  factory SeriesData.fromJson(Map<String, dynamic> data) => SeriesData(
      id: data['id'],
      posterPath: "https://image.tmdb.org/t/p/w300/" + data['poster_path'],
      backdropPath: "https://image.tmdb.org/t/p/w500/" + data['backdrop_path'],
      originalName: data['original_name'],
      runtime: data['runtime'],
      overview: data['overview'],
      vote: (data['vote_average'] as num).toDouble() * 10,
      year: data['first_air_date'].toString().substring(0, 4),
      airDate: data['first_air_date']);

  @override
  List<Object> get props =>
      [posterPath, runtime, originalName, backdropPath, overview, vote];
}
