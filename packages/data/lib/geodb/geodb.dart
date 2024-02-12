import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';

// This is necessary for the generator to work.
part "geodb.chopper.dart";

final _baseUrl = Uri.parse('https://wft-geo-db.p.rapidapi.com');

const _apiKey = '3178c0a62emshe339f216426215ap12b38bjsn3ec012cea620';

abstract class GeoDBApi {
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
            headers: {
              'x-rapidapi-key': _apiKey,
              'x-rapidapi-host': 'wft-geo-db.p.rapidapi.com',
            },
          );
        }
      ],
      services: [
        CitiesService.create(),
      ],
    );
  }
}

@ChopperApi(baseUrl: '/v1')
abstract class CitiesService extends ChopperService {
  @Get(path: '/geo/countries')
  Future<Response<Map<String, dynamic>>> searchCountries(
    @Query() int radius,
    @Query() int minPopulation,
    @Path() String cityId,
  );

  @Get(path: '/geo/cities/{cityId}/nearbyCities')
  Future<Response<Map<String, dynamic>>> searchCities(
    @Query() int radius,
    @Query() int minPopulation,
    @Path() String cityId,
  );

  static CitiesService create([ChopperClient? client]) =>
      _$CitiesService(client);
}
