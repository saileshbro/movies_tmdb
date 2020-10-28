import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_tmdb/domain/entities/app_error.dart';
import 'package:movies_tmdb/domain/entities/movie_entity.dart';
import 'package:movies_tmdb/domain/entities/no_params.dart';
import 'package:movies_tmdb/domain/usecases/get_trending.dart';
import 'package:movies_tmdb/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

@lazySingleton
class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;
  MovieCarouselBloc({this.movieBackdropBloc, this.getTrending})
      : super(MovieCarouselInitial());

  @override
  Stream<MovieCarouselState> mapEventToState(
    MovieCarouselEvent event,
  ) async* {
    if (event is CarouselLoadEvent) {
      final moviesEither = await getTrending(NoParams());
      yield moviesEither.fold(
        (l) => MovieCarouselError(l),
        (movies) {
          movieBackdropBloc
              .add(MovieBackdropChangedEvent(movies[event.defaultIndex]));
          return MovieCarouselLoaded(
              movies: movies, defaultIndex: event.defaultIndex);
        },
      );
    }
  }
}
