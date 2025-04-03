// lib/providers/notes_provider.dart
import 'package:flutter/foundation.dart';
import 'package:notes_app/DataBase/database_helper.dart';
import 'package:notes_app/DataBase/note_model.dart';

class NotesProvider extends ChangeNotifier {
  final SqlHelper _sqlHelper = SqlHelper();
  List<Map> _notes = [];
  bool _isLoading = false;

  List<Map> get notes => _notes;
  bool get isLoading => _isLoading;

  Future<void> loadNotes() async {
    _isLoading = true;
    notifyListeners();

    try {
      _notes = await _sqlHelper.getNotes();
    } catch (e) {
      if (kDebugMode) {
        print('Error loading notes: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addNote(Notes note) async {
    try {
      await _sqlHelper.addNote(note);
      await loadNotes();
    } catch (e) {
      if (kDebugMode) {
        print('Error adding note: $e');
      }
      rethrow;
    }
  }

  Future<void> deleteNote(int id) async {
    try {
      await _sqlHelper.deleteNote(id);
      await loadNotes();
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting note: $e');
      }
      rethrow;
    }
  }

  Future<void> deleteAllNotes() async {
    try {
      await _sqlHelper.deleteAllNotes();
      await loadNotes();
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting all notes: $e');
      }
      rethrow;
    }
  }

  Future<void> updateNote(Notes note) async {
    try {
      await _sqlHelper.updateNote(note);
      await loadNotes();
    } catch (e) {
      if (kDebugMode) {
        print('Error updating note: $e');
      }
      rethrow;
    }
  }
}
