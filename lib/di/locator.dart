import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_tmdb/di/locator.config.dart';

final GetIt locator = GetIt.instance;

@InjectableInit(
  preferRelativeImports: false,
)
void setupLocator() => $initGetIt(locator);
