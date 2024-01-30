import 'dart:convert';

import 'package:http/http.dart' as http;

final _baseUrl = Uri.parse('https://api.pexels.com');

const _apiKey = 'mMvz9HpzD29UuXAecX7cDvxmj5lQH7jOKHEJxYoEtADMs1JIIl2LeN5V';

abstract class PexelsApi {
  static Future<T> fetch<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic) fromJson,
  }) async {
    final response = await http.get(
      _baseUrl.replace(
        path: '/v1/$path',
        queryParameters: queryParameters,
      ),
      headers: {'Authorization': _apiKey},
    );

    if (response.statusCode == 200) {
      return fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}

const map = {
  'photos': [
    {
      'photographer': 'John Doe',
      'src': {
        'original': 'https://images.pexels.com/photos/699466/pexels-photo-699466.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      },
    },
  ],
};

