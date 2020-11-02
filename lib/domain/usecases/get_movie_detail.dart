import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_tmdb/domain/entities/app_error.dart';
import 'package:movies_tmdb/domain/entities/movie_detail_entity.dart';
import 'package:movies_tmdb/domain/entities/movie_params.dart';
import 'package:movies_tmdb/domain/repositories/movie_repository.dart';
import 'package:movies_tmdb/domain/usecases/usecase.dart';

@lazySingleton
class GetMovieDetail implements UseCase<MovieDetailEntity, MovieParams> {
  final MovieRepository _repository;
  GetMovieDetail(this._repository);
  @override
  Future<Either<AppError, MovieDetailEntity>> call(MovieParams params) async {
    return _repository.getMovieDetail(params.id);
  }
}
