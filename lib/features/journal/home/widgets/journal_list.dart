import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:travlr/features/journal/home/widgets/journal_card.dart';
import 'package:travlr/features/journal/home/widgets/new_journal_entry.dart';

class JournalList extends StatelessWidget {
  const JournalList({
    super.key,
    required this.journal,
  });

  final List<JournalEntry> journal;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const NewJournalEntry(),
        ...journal.map(
          (entry) => JournalCard(
            entry: entry,
          ),
        ),
      ],
    );
  }
}
