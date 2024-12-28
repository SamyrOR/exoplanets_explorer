import 'dart:convert';
import 'dart:io';

import 'package:exoplanets_explorer/data/services/models/exoplanet_api_model.dart';

import '../../utils/result.dart';

class ExoplanetsApiClient {
  final String _host;
  final int _port;
  final HttpClient Function() _clientFactory;

  ExoplanetsApiClient({
    String? host,
    int? port,
    HttpClient Function()? clientFactory,
  })  : _host = host ?? 'localhost',
        _port = port ?? 4000,
        _clientFactory = clientFactory ?? (() => HttpClient());

  Future<Result<List<ExoplanetApiModel>>> getExoplanets() async {
    final client = _clientFactory();
    try {
      final request = await client.get('10.0.2.2', _port, '/api/exoplanets');
      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final json = jsonDecode(stringData) as Map<String, dynamic>;
        final jsonArray = jsonDecode(json['data']) as List<dynamic>;
        print(jsonArray);
        // final json = jsonDecode(stringData) as List<dynamic>;
        return Result.ok(jsonArray
            .map((element) => ExoplanetApiModel.fromJson(element))
            .toList());
      } else {
        return const Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }
}
