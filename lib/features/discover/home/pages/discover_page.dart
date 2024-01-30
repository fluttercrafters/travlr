import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travlr/core/app/navigation.dart';
import 'package:travlr/features/discover/home/cubit/discover_cubit.dart';
import 'package:travlr/features/discover/home/widgets/popular_destination_card.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiscoverCubit(),
      child: const _DiscoverPage(),
    );
  }
}

class _DiscoverPage extends StatelessWidget {
  const _DiscoverPage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Discover',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'Find your next destination and start your next adventure.',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          BlocSelector<DiscoverCubit, DiscoverState, String>(
            selector: (state) {
              return state.searchTerm;
            },
            builder: (context, searchTerm) {
              return SearchBar(
                hintText: 'Search for a destination',
                onChanged: (value) =>
                    context.read<DiscoverCubit>().onSearchTermChanged(value),
                trailing: [
                  IconButton(
                    onPressed: () =>
                        context.push('${TravlrRoutes.discoverSearch}?searchTerm=$searchTerm'),
                    icon: const Icon(Icons.search),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 30),
          Text(
            'Popular destinations',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: const [
                PopularDestinationCard(
                  destination: 'Paris',
                  imageUrl:
                      'https://images.pexels.com/photos/699466/pexels-photo-699466.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                ),
                PopularDestinationCard(
                  destination: 'London',
                  imageUrl:
                      'https://images.pexels.com/photos/372490/pexels-photo-372490.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                ),
                PopularDestinationCard(
                  destination: 'New York',
                  imageUrl:
                      'https://images.pexels.com/photos/802024/pexels-photo-802024.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                ),
                PopularDestinationCard(
                  destination: 'Tokyo',
                  imageUrl:
                      'https://images.pexels.com/photos/161251/senso-ji-temple-japan-kyoto-landmark-161251.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
