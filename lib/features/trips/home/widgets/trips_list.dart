import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:travlr/features/trips/home/widgets/new_trip_card.dart';
import 'package:travlr/features/trips/home/widgets/trip_card.dart';

class TripsList extends StatelessWidget {
  const TripsList({
    super.key,
    required this.trips,
  });

  final List<Trip> trips;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const NewTripCard(),
        ...trips.map(
          (e) => TripCard(
            destination: e.destination,
            date: e.date,
            imageUrl: e.imageUrl,
          ),
        ),
      ],
    );
  }
}
