import 'package:domain/domain.dart';
import 'package:domain/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_results_state.dart';

class SearchResultsCubit extends Cubit<SearchResultsState> {
  SearchResultsCubit(
    this._repository,
  ) : super(const SearchResultsState());

  final TripRepository _repository;

  void search(String query) async {
    emit(state.copyWith(isLoading: true));
    final trips = await _repository.search(query: query);
    
    emit(state.copyWith(trips: trips));
    emit(state.copyWith(isLoading: false));
  }
}
