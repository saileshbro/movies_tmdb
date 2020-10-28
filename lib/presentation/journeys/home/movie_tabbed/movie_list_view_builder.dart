import 'package:flutter/material.dart';
import 'package:movies_tmdb/domain/entities/movie_entity.dart';
import 'package:movies_tmdb/common/extensions/extensions.dart';
import 'package:movies_tmdb/presentation/journeys/home/movie_tabbed/movie_tab_card_widget.dart';

class MovieListViewBuilder extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieListViewBuilder({Key key, @required this.movies})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: ListView.separated(
        itemCount: movies.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => MovieTabCardWidget(
          movieId: movies[index].id,
          title: movies[index].title,
          posterPath: movies[index].posterPath,
        ),
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          width: 14.w,
        ),
      ),
    );
  }
}
