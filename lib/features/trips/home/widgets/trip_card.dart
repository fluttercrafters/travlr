import 'package:flutter/material.dart';

class TripCard extends StatelessWidget {
  const TripCard({
    super.key,
    required this.destination,
    required this.date,
    required this.imageUrl,
  });

  final String destination;
  final DateTime date;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(8),
      child: SizedBox(
        height: 120,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                imageUrl,
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary.withOpacity(0.5),
                      Theme.of(context).colorScheme.primary.withOpacity(0.4),
                      Theme.of(context).colorScheme.primary.withOpacity(0.3),
                      Colors.transparent,
                      Colors.transparent,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Text(
                  destination,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
