import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travlr/features/trips/home/cubit/trips_cubit.dart';
import 'package:travlr/features/trips/home/widgets/empty_trips.dart';
import 'package:travlr/features/trips/home/widgets/trips_list.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripsCubit(
        context.read()
      )..load(),
      child: const _TripsPage(),
    );
  }
}

class _TripsPage extends StatelessWidget {
  const _TripsPage();

  @override
  Widget build(BuildContext context) {
    final tripEntries = context.select(
      (TripsCubit cubit) => cubit.state.trips,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Trips',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: tripEntries.isEmpty
                ? const EmptyTrips()
                : TripsList(
                    trips: tripEntries,
                  ),
          ),
        ],
      ),
    );
  }
}
