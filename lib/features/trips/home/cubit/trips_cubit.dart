import 'package:domain/models/trip.dart';
import 'package:domain/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'trips_state.dart';

class TripsCubit extends Cubit<TripsState> {
  TripsCubit(
    this._tripRepository,
  ) : super(const TripsState()){
    _tripRepository.trips.listen((event) {
      emit(
        state.copyWith(
          trips: event,
        ),
      );
    });
  }

  final TripRepository _tripRepository;

  Future<void> load() async {
    await _tripRepository.fetchTrips();
  }
}
