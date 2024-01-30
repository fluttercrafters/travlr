import 'dart:async';

import 'package:data/pexels/pexels.dart';
import 'package:domain/models/trip.dart';
import 'package:domain/repositories/trip_repository.dart';
import 'package:rxdart/rxdart.dart';

final tripEntries = [
  Trip(
    destination: 'Paris',
    date: DateTime(2021, 10, 2),
    imageUrl:
        'https://images.pexels.com/photos/699466/pexels-photo-699466.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ),
  Trip(
    destination: 'London',
    date: DateTime(2021, 10, 1),
    imageUrl:
        'https://images.pexels.com/photos/372490/pexels-photo-372490.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ),
  Trip(
    destination: 'New York',
    date: DateTime(2021, 10, 3),
    imageUrl:
        'https://images.pexels.com/photos/802024/pexels-photo-802024.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ),
  Trip(
    destination: 'Tokyo',
    date: DateTime(2021, 10, 4),
    imageUrl:
        'https://images.pexels.com/photos/161251/senso-ji-temple-japan-kyoto-landmark-161251.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ),
];

class TripRepositoryImpl extends TripRepository {
  @override
  Future<List<Trip>> fetchTrips() async {
    await Future.delayed(const Duration(seconds: 2));
    _tripsController.add(tripEntries);

    return tripEntries;
  }

  @override
  Stream<List<Trip>> get trips => _tripsController.stream;

  final StreamController<List<Trip>> _tripsController =
      BehaviorSubject<List<Trip>>.seeded([]);

  @override
  Future<List<Trip>> search({required String query}) async {
    // TODO Load from API
    final response = await PexelsApi.fetch<List<Trip>>(
      '/search',
      queryParameters: {
        'query': query,
      },
      fromJson: (json) {
        return (json['photos'] as List)
            .map((rawPhoto) => Trip.fromJson(rawPhoto))
            .toList();
      },
    );

    return response;
  }
}
