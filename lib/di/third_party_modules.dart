import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@module
abstract class ThirdPartyModules {
  @lazySingleton
  http.Client get client => http.Client();
}
