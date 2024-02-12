import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:data/pexels/responses/search_photo_response.dart';
import 'package:flutter/foundation.dart';

// This is necessary for the generator to work.
part "pexels.chopper.dart";

final _baseUrl = Uri.parse('https://api.pexels.com');

const _apiKey = 'mMvz9HpzD29UuXAecX7cDvxmj5lQH7jOKHEJxYoEtADMs1JIIl2LeN5V';

abstract class PexelsApi {
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
              'Authorization': _apiKey,
            },
          );
        }
      ],
      services: [
        PhotoService.create(),
      ],
    );
  }
}

@ChopperApi(baseUrl: '/v1')
abstract class PhotoService extends ChopperService {
  @Get(path: '/search')
  Future<Response<SearchPhotoResponse>> searchPhotos(
    @Query() String query,
  );

  static PhotoService create([ChopperClient? client]) => _$PhotoService(client);
}