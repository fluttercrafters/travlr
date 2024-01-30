part of 'journal_cubit.dart';

class JournalState extends Equatable {
  const JournalState({
    this.journalEntries = const [],
  });

  final List<JournalEntry> journalEntries;

  @override
  List<Object> get props => [
        journalEntries,
      ];

  JournalState copyWith({
    List<JournalEntry>? journalEntries,
  }) {
    return JournalState(
      journalEntries: journalEntries ?? this.journalEntries,
    );
  }
}
