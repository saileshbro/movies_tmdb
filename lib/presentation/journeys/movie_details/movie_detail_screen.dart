import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_tmdb/common/constants/size_constants.dart';
import 'package:movies_tmdb/di/locator.dart';
import 'package:movies_tmdb/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movies_tmdb/presentation/journeys/movie_details/big_posture.dart';
import 'package:movies_tmdb/presentation/journeys/movie_details/movie_detail_arguments.dart';
import 'package:movies_tmdb/common/extensions/extensions.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;

  const MovieDetailScreen({
    Key key,
    @required this.movieDetailArguments,
  })  : assert(movieDetailArguments != null, "arguments cannot be null"),
        super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  MovieDetailBloc _movieDetailBloc;
  @override
  void initState() {
    _movieDetailBloc = locator<MovieDetailBloc>()
      ..add(MovieDetailLoadEvent(widget.movieDetailArguments.movieId));
    super.initState();
  }

  @override
  void dispose() {
    _movieDetailBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: _movieDetailBloc,
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              final movieDetailEntity = state.movieDetailEntity;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BigPosture(
                    movie: movieDetailEntity,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
                    child: Text(
                      state.movieDetailEntity.overview,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              );
            } else if (state is MovieDetailError) {}
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
