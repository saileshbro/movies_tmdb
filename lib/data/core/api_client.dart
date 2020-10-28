import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_tmdb/data/core/api_constants.dart';

@lazySingleton
class ApiClient {
  final Client _client;
  ApiClient(this._client);
  Future<dynamic> get(String path) async {
    final Response response = await _client.get(
      "${ApiConstants.baseUrl}$path?api_key=${ApiConstants.apiKey}",
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
