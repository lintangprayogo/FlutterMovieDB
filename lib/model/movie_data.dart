part of 'models.dart';

class MovieData extends Equatable {
  final int id;
  final String posterPath;
  final int runtime;
  final String originalTitle;
  final String backdropPath;
  final String overview;
  final double vote;
  final String year;
  final String realeseDate;

  MovieData(
      {this.id,
      this.backdropPath,
      this.originalTitle,
      this.posterPath,
      this.runtime,
      this.overview,
      this.vote,
      this.year,
      this.realeseDate});

  factory MovieData.fromJson(Map<String, dynamic> data) => MovieData(
      id: data['id'],
      posterPath: "https://image.tmdb.org/t/p/w200/" + data['poster_path'],
      backdropPath: "https://image.tmdb.org/t/p/w500/" + data['backdrop_path'],
      originalTitle: data['original_title'],
      runtime: data['runtime'],
      overview: data['overview'],
      vote: (data['vote_average'] as num).toDouble() * 10,
      year: data['release_date'].toString().substring(0, 4),
      realeseDate: data['release_date']);

  @override
  List<Object> get props => [
        id,
        posterPath,
        runtime,
        originalTitle,
        backdropPath,
        overview,
        vote,
        realeseDate
      ];
}
