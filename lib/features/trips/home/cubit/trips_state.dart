part of 'trips_cubit.dart';

final class TripsState extends Equatable {
  const TripsState({
    this.trips = const [],
  });

  final List<Trip> trips;

  @override
  List<Object> get props => [
        trips,
      ];

  TripsState copyWith({
    List<Trip>? trips,
  }) {
    return TripsState(
      trips: trips ?? this.trips,
    );
  }
}
