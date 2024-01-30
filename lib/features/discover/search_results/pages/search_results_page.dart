import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travlr/features/discover/search_results/cubit/search_results_cubit.dart';

class SearchResultsPage extends StatelessWidget {
  const SearchResultsPage({
    super.key,
    this.searchTerm = '',
  });

  final String searchTerm;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchResultsCubit(
        context.read(),
      )..search(searchTerm),
      child: _SearchResultsPage(searchTerm: searchTerm),
    );
  }
}

class _SearchResultsPage extends StatelessWidget {
  const _SearchResultsPage({
    this.searchTerm = '',
  });

  final String searchTerm;

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<SearchResultsCubit>().state.isLoading;
    final trips = context.watch<SearchResultsCubit>().state.trips;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Searching for $searchTerm',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              padding: const EdgeInsets.all(8),
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: trips
                  .map(
                    (e) => Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.network(
                        e.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                  .toList(),
            ),
    );
  }
}
