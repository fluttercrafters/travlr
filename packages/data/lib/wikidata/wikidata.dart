import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';

// This is necessary for the generator to work.
part "wikidata.chopper.dart";

final _baseUrl = Uri.parse('https://query.wikidata.org');

abstract class WikiDataApi {
  static late ChopperClient client;

  static Future<void> initialize() async {
    client = ChopperClient(
      baseUrl: _baseUrl,
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        if (kDebugMode) HttpLoggingInterceptor(),
        (Request request) {
          return request.copyWith(
            parameters: request.parameters
              ..addAll({
                'format': 'json',
              }),
          );
        }
      ],
      services: [
        QueryService.create(),
      ],
    );
  }
}

@ChopperApi(baseUrl: '/v1')
abstract class QueryService extends ChopperService {
  @Get(path: '/search')
  Future<Response<Map<String, dynamic>>> searchPhotos(
    @Query() String query,
  );

  static QueryService create([ChopperClient? client]) => _$QueryService(client);
}
