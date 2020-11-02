import 'package:injectable/injectable.dart';
import 'package:movies_tmdb/data/core/api_client.dart';
import 'package:movies_tmdb/data/models/movie.dart';
import 'package:movies_tmdb/data/models/movie_detail_model.dart';
import 'package:movies_tmdb/data/models/movies_response_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<Movie>> getTrending();
  Future<List<Movie>> getPopular();
  Future<List<Movie>> getPlayingNow();
  Future<List<Movie>> getCommingSoon();

  Future<MovieDetailModel> getMovieDetail(int id);
}

@LazySingleton(as: MovieRemoteDataSource)
class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);
  @override
  Future<List<Movie>> getTrending() async {
    final response = await _client.get(
      "/trending/movie/day",
    );
    return MoviesResponseModel.fromJson(response).movies;
  }

  @override
  Future<List<Movie>> getPopular() async {
    final response = await _client.get(
      "/movie/popular",
    );
    return MoviesResponseModel.fromJson(response).movies;
  }

  @override
  Future<List<Movie>> getCommingSoon() async {
    final response = await _client.get(
      "/movie/upcoming",
    );
    return MoviesResponseModel.fromJson(response).movies;
  }

  @override
  Future<List<Movie>> getPlayingNow() async {
    final response = await _client.get(
      "/movie/now_playing",
    );
    return MoviesResponseModel.fromJson(response).movies;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final response = await _client.get(
      "/movie/$id",
    );
    return MovieDetailModel.fromJson(response);
  }
}
