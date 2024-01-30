import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:travlr/core/app/navigation.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              child: SvgPicture.asset(
                'assets/images/not_found.svg',
                semanticsLabel:
                    'Illustration of a person placing multiple pins in a map.',
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Something\'s missing!',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'The app couldn\'t find the page you were looking for.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.replace(TravlrRoutes.home),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}