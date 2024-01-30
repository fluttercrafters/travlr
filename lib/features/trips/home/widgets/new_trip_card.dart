import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewTripCard extends StatelessWidget {
  const NewTripCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(8),
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.primaryContainer,
        highlightColor:
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
        onTap: () => context.go('/trips/new'),
        child: SizedBox(
          height: 120,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_box_outlined,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(width: 10),
                Text(
                  'NEW TRIP',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
