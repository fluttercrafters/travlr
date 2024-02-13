import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:travlr/core/app/navigation.dart';

class EmptyTrips extends StatelessWidget {
  const EmptyTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 150,
            child: SvgPicture.asset(
              'assets/images/no_trips.svg',
              semanticsLabel:
                  'Illustration of a person placing multiple pins in a map.',
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'No trips yet',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'Are you ready to explore the world?'
            '\nFind your next destination and start your next adventure.',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: ()  => context.go('${TravlrRoutes.home}?tab=1'),
            child: const Text('Find your next destination'),
          ),
        ],
      ),
    );
  }
}
