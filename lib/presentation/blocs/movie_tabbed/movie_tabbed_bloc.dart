import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_tmdb/domain/entities/app_error.dart';
import 'package:movies_tmdb/domain/entities/movie_entity.dart';
import 'package:movies_tmdb/domain/entities/no_params.dart';
import 'package:movies_tmdb/domain/usecases/get_coming_soon.dart';
import 'package:movies_tmdb/domain/usecases/get_playing_now.dart';
import 'package:movies_tmdb/domain/usecases/get_popular.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

@lazySingleton
class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;

  MovieTabbedBloc({
    @required this.getPopular,
    @required this.getPlayingNow,
    @required this.getComingSoon,
  }) : super(MovieTabbedInitial());

  @override
  Stream<MovieTabbedState> mapEventToState(
    MovieTabbedEvent event,
  ) async* {
    if (event is MovieTabChangedEvent) {
      Either<AppError, List<MovieEntity>> movies;
      switch (event.currentTabIndex) {
        case 0:
          movies = await getPopular(NoParams());
          break;
        case 1:
          movies = await getPlayingNow(NoParams());
          break;
        case 2:
          movies = await getComingSoon(NoParams());
          break;
      }
      yield movies.fold(
        (l) =>
            MovieTabLoadError(currentTabIndex: event.currentTabIndex, error: l),
        (r) => MovieTabChanged(
          currentTabIndex: event.currentTabIndex,
          movies: r,
        ),
      );
    }
  }
}
