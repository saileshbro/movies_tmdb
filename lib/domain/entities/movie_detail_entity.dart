import 'package:equatable/equatable.dart';

class MovieDetailEntity extends Equatable {
  final String title;
  final String overview;
  final String releaseDate;
  final num voteAverage;
  final String backdropPath;
  final int id;
  final String posterPath;

  const MovieDetailEntity({
    this.title,
    this.overview,
    this.releaseDate,
    this.voteAverage,
    this.backdropPath,
    this.id,
    this.posterPath,
  });

  @override
  List<Object> get props => [id];
}
