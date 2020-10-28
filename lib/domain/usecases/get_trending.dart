import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_tmdb/domain/entities/app_error.dart';
import 'package:movies_tmdb/domain/entities/movie_entity.dart';
import 'package:movies_tmdb/domain/entities/no_params.dart';
import 'package:movies_tmdb/domain/repositories/movie_repository.dart';
import 'package:movies_tmdb/domain/usecases/usecase.dart';

@lazySingleton
class GetTrending implements UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository _repository;
  GetTrending(this._repository);
  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return _repository.getTrending();
  }
}
