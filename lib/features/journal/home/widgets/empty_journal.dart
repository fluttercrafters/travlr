import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:travlr/core/app/navigation.dart';

class EmptyJournal extends StatelessWidget {
  const EmptyJournal({super.key});

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
              'assets/images/empty_journal.svg',
              semanticsLabel:
                  'Illustration of a person placing multiple pins in a map.',
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Not traveling',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'Start a trip to add journal entries'
            '\nand keep track of your adventures.',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => context.go('${TravlrRoutes.home}?tab=2'),
            child: const Text('Start a trip'),
          ),
        ],
      ),
    );
  }
}
