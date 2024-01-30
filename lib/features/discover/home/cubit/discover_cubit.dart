import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'discover_state.dart';

class DiscoverCubit extends Cubit<DiscoverState> {
  DiscoverCubit() : super(const DiscoverState());

  void onSearchTermChanged(String searchTerm) {
    emit(state.copyWith(searchTerm: searchTerm));
  }
}
