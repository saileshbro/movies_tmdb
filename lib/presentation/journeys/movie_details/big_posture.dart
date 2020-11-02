import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_tmdb/common/constants/size_constants.dart';
import 'package:movies_tmdb/common/screenutil/screenutil.dart';
import 'package:movies_tmdb/data/core/api_constants.dart';
import 'package:movies_tmdb/domain/entities/movie_detail_entity.dart';
import 'package:movies_tmdb/common/extensions/extensions.dart';
import 'package:movies_tmdb/presentation/journeys/movie_details/movie_detail_app_bar.dart';

class BigPosture extends StatelessWidget {
  final MovieDetailEntity movie;

  const BigPosture({Key key, @required this.movie})
      : assert(movie != null, "movie detail cannot be null"),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.3),
                Theme.of(context).primaryColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: "${ApiConstants.baseImageUrl}${movie.backdropPath}",
            width: ScreenUtil.screenWidth,
            fit: BoxFit.fitHeight,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ListTile(
            title: Text(
              movie.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(
              movie.releaseDate,
              style: Theme.of(context).textTheme.greySubtitle1,
            ),
            trailing: Text(
              movie.voteAverage.convertToPercentage(),
              style: Theme.of(context).textTheme.violetHeadline6,
            ),
          ),
        ),
        Positioned(
          left: Sizes.dimen_16.w,
          right: Sizes.dimen_16.w,
          top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
          child: MovieDetailAppBar(),
        )
      ],
    );
  }
}
