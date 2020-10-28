import 'package:movies_tmdb/data/models/movie.dart';

class MoviesResponseModel {
  int page;
  List<Movie> movies;
  int totalPages;
  int totalResults;

  MoviesResponseModel(
      {this.page, this.movies, this.totalPages, this.totalResults});

  MoviesResponseModel.fromJson(Map<String, dynamic> json) {
    page = json['page'] as int;
    if (json['results'] != null) {
      movies = <Movie>[];
      json['results'].forEach((v) {
        movies.add(Movie.fromJson(v));
      });
    }
    totalPages = json['total_pages'] as int;
    totalResults = json['total_results'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (movies != null) {
      data['results'] = movies.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
