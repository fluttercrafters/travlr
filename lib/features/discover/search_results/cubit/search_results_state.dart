part of 'search_results_cubit.dart';

final class SearchResultsState extends Equatable {
  const SearchResultsState({
    this.isLoading = true,
    this.trips = const <Trip>[],
  });

  final List<Trip> trips;
  final bool isLoading;

  @override
  List<Object> get props => [
        trips,
        isLoading
      ];

  SearchResultsState copyWith({
    List<Trip>? trips,
    bool? isLoading,
  }) {
    return SearchResultsState(
      isLoading: isLoading ?? this.isLoading,
      trips: trips ?? this.trips,
    );
  }
}
