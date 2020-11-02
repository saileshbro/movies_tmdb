import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_tmdb/common/constants/size_constants.dart';
import 'package:movies_tmdb/data/core/api_constants.dart';
import 'package:movies_tmdb/common/extensions/extensions.dart';
import 'package:movies_tmdb/presentation/journeys/movie_details/movie_detail_arguments.dart';
import 'package:movies_tmdb/presentation/journeys/movie_details/movie_detail_screen.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;

  const MovieCardWidget({
    Key key,
    @required this.movieId,
    @required this.posterPath,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 32,
      type: MaterialType.transparency,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => MovieDetailScreen(
                movieDetailArguments: MovieDetailArguments(movieId),
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
          child: CachedNetworkImage(
            imageUrl: "${ApiConstants.baseImageUrl}$posterPath",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
