import 'dart:async';

import 'package:domain/models/journal_entry.dart';
import 'package:domain/repositories/journal_repository.dart';
import 'package:rxdart/rxdart.dart';

final journalEntries = [
  JournalEntry(
    title: 'First entry',
    date: DateTime(2021, 10, 1),
    content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
        'Sed euismod, nisl quis aliquam ultricies, '
        'nunc nisl aliquet nunc, quis aliquam nisl nunc vitae nunc. '
        'Sed euismod, nisl quis aliquam ultricies, '
        'nunc nisl aliquet nunc, quis aliquam nisl nunc vitae nunc. '
        'Sed euismod, nisl quis aliquam ultricies, '
        'nunc nisl aliquet nunc, quis aliquam nisl nunc vitae nunc. '
        'Sed euismod, nisl quis aliquam ultricies, '
        'nunc nisl aliquet nunc, quis aliquam nisl nunc vitae nunc. '
        'Sed euismod, nisl quis aliquam ultricies, '
        'nunc nisl aliquet nunc, quis aliquam nisl nunc vitae nunc. '
        'Sed euismod, nisl quis aliquam ultricies, '
        'nunc nisl aliquet nunc, quis aliquam nisl nunc vitae nunc. '
        'Sed euismod, nisl quis aliquam ultricies, '
        'nunc nisl aliquet nunc, quis aliquam nisl nunc vitae nunc. '
        'Sed euismod, nisl quis aliquam ultricies, '
        'nunc nisl aliquet nunc, quis aliquam nisl nunc vitae nunc.',
  ),
  JournalEntry(
    title: 'Second entry',
    date: DateTime(2021, 10, 2),
    content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
        'Sed euismod, nisl quis aliquam ultricies, '
        'nunc nisl aliquet nunc, quis aliquam nisl nunc vitae nunc.',
  ),
  JournalEntry(
    title: 'Third entry',
    date: DateTime(2021, 10, 3),
    content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
        'Sed euismod, nisl quis aliquam ultricies, '
        'nunc nisl aliquet nunc, quis aliquam nisl nunc vitae nunc.',
  ),
];

class JournalRepositoryImpl extends JournalRepository {
  @override
  Future<List<JournalEntry>> fetchJournal() async {
    await Future.delayed(const Duration(seconds: 2));
    _journalController.add(journalEntries);

    return journalEntries;
  }

  @override
  Stream<List<JournalEntry>> get journal => _journalController.stream;

  final StreamController<List<JournalEntry>> _journalController =
      BehaviorSubject<List<JournalEntry>>.seeded([]);
}
