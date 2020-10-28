import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_tmdb/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movies_tmdb/presentation/journeys/drawers/navigation_drawer.dart';
import 'package:movies_tmdb/presentation/widgets/app_error_widget.dart';
import 'package:movies_tmdb/presentation/journeys/home/movie_carousel/movie_carousel_widget.dart';
import 'package:movies_tmdb/presentation/journeys/home/movie_tabbed/movie_tabbed_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.bloc<MovieCarouselBloc>().add(const CarouselLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
        builder: (context, state) {
          if (state is MovieCarouselLoaded) {
            return Column(
              children: [
                Expanded(
                  flex: 6,
                  child: MovieCarouselWidget(
                    movies: state.movies,
                    defaultIndex: state.defaultIndex,
                  ),
                ),
                const Expanded(
                  flex: 4,
                  child: MovieTabbedWidget(),
                ),
              ],
            );
          } else if (state is MovieCarouselError) {
            return AppErrorWidget(
              appErrorType: state.error.appErrorType,
              onRetry: () => context
                  .bloc<MovieCarouselBloc>()
                  .add(const CarouselLoadEvent()),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
