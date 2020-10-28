import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_tmdb/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_tmdb/data/models/movie.dart';
import 'package:movies_tmdb/domain/entities/app_error.dart';
import 'package:movies_tmdb/domain/entities/movie_entity.dart';
import 'package:movies_tmdb/domain/repositories/movie_repository.dart';

@LazySingleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource _remoteDataSource;
  MovieRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<AppError, List<Movie>>> getTrending() async {
    try {
      return right(await _remoteDataSource.getTrending());
    } on Exception {
      return left(const AppError("Something went wrong."));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getComingSoon() async {
    try {
      return right(await _remoteDataSource.getCommingSoon());
    } on Exception {
      return left(const AppError("Something went wrong."));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
    try {
      return right(await _remoteDataSource.getPlayingNow());
    } on Exception {
      return left(const AppError("Something went wrong."));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async {
    try {
      return right(await _remoteDataSource.getPopular());
    } on Exception {
      return left(const AppError("Something went wrong."));
    }
  }
}
