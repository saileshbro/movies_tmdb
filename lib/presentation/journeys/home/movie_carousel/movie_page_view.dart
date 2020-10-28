import 'package:flutter/material.dart';
import 'package:movies_tmdb/common/constants/size_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_tmdb/common/screenutil/screenutil.dart';
import 'package:movies_tmdb/domain/entities/movie_entity.dart';
import 'package:movies_tmdb/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movies_tmdb/presentation/journeys/home/movie_carousel/animated_movie_card_widget.dart';
import 'package:movies_tmdb/common/extensions/extensions.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;

  const MoviePageView({
    Key key,
    @required this.movies,
    @required this.initialPage,
  })  : assert(initialPage >= 0, "defaultIndex cannot be less than 0"),
        super(key: key);
  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      height: ScreenUtil.screenHeight * 0.35,
      child: PageView.builder(
        onPageChanged: (index) {
          context.bloc<MovieBackdropBloc>().add(
                MovieBackdropChangedEvent(
                  widget.movies[index],
                ),
              );
        },
        itemCount: widget.movies?.length ?? 0,
        controller: _pageController,
        itemBuilder: (context, index) {
          return AnimatedMovieCardWidget(
            index: index,
            pageController: _pageController,
            movieId: widget.movies[index].id,
            posterPath: widget.movies[index].posterPath,
          );
        },
      ),
    );
  }
}
