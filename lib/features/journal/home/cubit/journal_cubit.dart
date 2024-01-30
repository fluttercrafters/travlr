import 'package:domain/models/journal_entry.dart';
import 'package:domain/repositories/journal_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'journal_state.dart';

class JournalCubit extends Cubit<JournalState> {
  JournalCubit(
    this._journalRepository,
  ) : super(const JournalState()) {
    _journalRepository.journal.listen((event) {
      emit(
        state.copyWith(
          journalEntries: event,
        ),
      );
    });
  }

  final JournalRepository _journalRepository;

  Future<void> load() async {
    await _journalRepository.fetchJournal();
  }
}
