import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies_tmdb/common/constants/languages.dart';
import 'package:movies_tmdb/common/screenutil/screenutil.dart';
import 'package:movies_tmdb/di/locator.dart';
import 'package:movies_tmdb/presentation/app_localizations.dart';
import 'package:movies_tmdb/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movies_tmdb/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movies_tmdb/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movies_tmdb/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movies_tmdb/presentation/journeys/home/home_screen.dart';
import 'package:movies_tmdb/presentation/themes/theme_color.dart';
import 'package:movies_tmdb/presentation/themes/theme_text.dart';
import 'package:movies_tmdb/presentation/wiredash_app.dart';

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  MovieCarouselBloc movieCarouselBloc;
  MovieBackdropBloc movieBackdropBloc;
  MovieTabbedBloc movieTabbedBloc;
  LanguageBloc languageBloc;
  @override
  void initState() {
    movieCarouselBloc = locator<MovieCarouselBloc>();
    movieBackdropBloc = locator<MovieBackdropBloc>();
    movieTabbedBloc = locator<MovieTabbedBloc>();
    languageBloc = locator<LanguageBloc>();
    super.initState();
  }

  @override
  void dispose() {
    movieCarouselBloc?.close();
    movieBackdropBloc?.close();
    movieTabbedBloc?.close();
    languageBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieCarouselBloc>(create: (context) => movieCarouselBloc),
        BlocProvider<MovieBackdropBloc>(create: (context) => movieBackdropBloc),
        BlocProvider<MovieTabbedBloc>(create: (context) => movieTabbedBloc),
        BlocProvider<LanguageBloc>(create: (context) => languageBloc),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is LanguageLoaded) {
            return WiredashApp(
              navigatorKey: _navigatorKey,
              languageCode: state.locale.languageCode,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: "Movies TMDb",
                theme: ThemeData(
                  unselectedWidgetColor: AppColor.royalBlue,
                  primaryColor: AppColor.vulcan,
                  scaffoldBackgroundColor: AppColor.vulcan,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  textTheme: ThemeText.getTextTheme(),
                  appBarTheme: const AppBarTheme(elevation: 0),
                  accentColor: AppColor.royalBlue,
                ),
                navigatorKey: _navigatorKey,
                home: const HomeScreen(),
                supportedLocales:
                    Languages.langages.map((e) => Locale(e.code)).toList(),
                locale: state.locale,
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  AppLocalizations.delegate,
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
