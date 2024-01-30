import 'package:domain/domain.dart';

abstract class TripRepository {
  Stream<List<Trip>> get trips;
  Future<List<Trip>> fetchTrips();

  Future<List<Trip>> search({
    required String query,
  });
}
