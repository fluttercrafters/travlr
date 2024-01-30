part of 'discover_cubit.dart';

final class DiscoverState extends Equatable {
  const DiscoverState({
    this.searchTerm = '',
  });

  final String searchTerm;

  @override
  List<Object> get props => [
        searchTerm,
      ];

  DiscoverState copyWith({
    String? searchTerm,
  }) {
    return DiscoverState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}
