import 'package:domain/domain.dart';

abstract class JournalRepository {
  Stream<List<JournalEntry>> get journal;
  Future<List<JournalEntry>> fetchJournal();
}