import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travlr/features/journal/home/cubit/journal_cubit.dart';
import 'package:travlr/features/journal/home/widgets/empty_journal.dart';
import 'package:travlr/features/journal/home/widgets/journal_list.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JournalCubit(
        context.read(),
      ),
      child: const _JournalPage(),
    );
  }
}

class _JournalPage extends StatelessWidget {
  const _JournalPage();

  @override
  Widget build(BuildContext context) {
    final journalEntries = context.select(
      (JournalCubit cubit) => cubit.state.journalEntries,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Journal',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: journalEntries.isEmpty
                ? const EmptyJournal()
                : JournalList(
                    journal: journalEntries,
                  ),
          ),
        ],
      ),
    );
  }
}
