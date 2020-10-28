// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:movies_tmdb/data/core/api_client.dart';
import 'package:http/http.dart';
import 'package:movies_tmdb/domain/usecases/get_coming_soon.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_tmdb/domain/usecases/get_playing_now.dart';
import 'package:movies_tmdb/domain/usecases/get_popular.dart';
import 'package:movies_tmdb/domain/usecases/get_trending.dart';
import 'package:movies_tmdb/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movies_tmdb/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movies_tmdb/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movies_tmdb/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_tmdb/domain/repositories/movie_repository.dart';
import 'package:movies_tmdb/data/repositories/movie_repository_impl.dart';
import 'package:movies_tmdb/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movies_tmdb/di/third_party_modules.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartyModules = _$ThirdPartyModules();
  gh.lazySingleton<Client>(() => thirdPartyModules.client);
  gh.lazySingleton<LanguageBloc>(() => LanguageBloc());
  gh.lazySingleton<MovieBackdropBloc>(() => MovieBackdropBloc());
  gh.lazySingleton<ApiClient>(() => ApiClient(get<Client>()));
  gh.lazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(get<ApiClient>()));
  gh.lazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(get<MovieRemoteDataSource>()));
  gh.lazySingleton<GetComingSoon>(() => GetComingSoon(get<MovieRepository>()));
  gh.lazySingleton<GetPlayingNow>(() => GetPlayingNow(get<MovieRepository>()));
  gh.lazySingleton<GetPopular>(() => GetPopular(get<MovieRepository>()));
  gh.lazySingleton<GetTrending>(() => GetTrending(get<MovieRepository>()));
  gh.lazySingleton<MovieCarouselBloc>(() => MovieCarouselBloc(
      movieBackdropBloc: get<MovieBackdropBloc>(),
      getTrending: get<GetTrending>()));
  gh.lazySingleton<MovieTabbedBloc>(() => MovieTabbedBloc(
        getPopular: get<GetPopular>(),
        getPlayingNow: get<GetPlayingNow>(),
        getComingSoon: get<GetComingSoon>(),
      ));
  return get;
}

class _$ThirdPartyModules extends ThirdPartyModules {}
