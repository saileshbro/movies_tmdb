import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_tmdb/di/locator.dart';
import 'package:movies_tmdb/presentation/movie_app.dart';
import 'package:pedantic/pedantic.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  unawaited(
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    ),
  );
  runApp(MovieApp());
}
