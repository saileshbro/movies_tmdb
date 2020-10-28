import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_tmdb/common/constants/size_constants.dart';
import 'package:movies_tmdb/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movies_tmdb/common/extensions/extensions.dart';
import 'package:movies_tmdb/presentation/journeys/home/movie_tabbed/movie_list_view_builder.dart';
import 'package:movies_tmdb/presentation/journeys/home/movie_tabbed/movie_tabbed_constants.dart';
import 'package:movies_tmdb/presentation/journeys/home/movie_tabbed/tab_title_widget.dart';

class MovieTabbedWidget extends StatefulWidget {
  final int currentTabIndex;

  const MovieTabbedWidget({Key key, this.currentTabIndex = 0})
      : assert(currentTabIndex >= 0, "currentTabIndex cannot be negative!"),
        super(key: key);
  @override
  _MovieTabbedWidgetState createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget> {
  @override
  void initState() {
    context
        .bloc<MovieTabbedBloc>()
        .add(MovieTabChangedEvent(currentTabIndex: widget.currentTabIndex));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: Sizes.dimen_4.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: MovieTabbedConstants.movieTabs
                    .asMap()
                    .entries
                    .map(
                      (e) => TabTitleWidget(
                        title: e.value.title,
                        onTap: () => _onTabTapped(e.key),
                        isSelected: e.value.index == state.currentTabIndex,
                      ),
                    )
                    .toList(),
              ),
              if (state is MovieTabChanged)
                Expanded(
                  child: MovieListViewBuilder(movies: state.movies),
                )
            ],
          ),
        );
      },
    );
  }

  void _onTabTapped(int key) {
    context
        .bloc<MovieTabbedBloc>()
        .add(MovieTabChangedEvent(currentTabIndex: key));
  }
}
