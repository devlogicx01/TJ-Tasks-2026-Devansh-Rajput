import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:notes_app/models/note.dart';

class StorageService {
  static const String notesKey = 'notes';

  Future<SharedPreferences> get _prefs async {
    return await SharedPreferences.getInstance();
  }

  Future<void> saveNotes(List<Note> notes) async {
    final prefs = await _prefs;

    final notesJson = notes.map((note) {
      return jsonEncode(note.toJson());
    }).toList();

    await prefs.setStringList(notesKey, notesJson);
  }

  Future<List<Note>> getNotes() async {
    final prefs = await _prefs;
    final notesJson = prefs.getStringList(notesKey);

    if (notesJson == null) {
      return [];
    }

    return notesJson.map((notesJson) {
      final noteMap = jsonDecode(notesJson);

      return Note.fromJson(noteMap);
    }).toList();
  }

  Future<void> updateNote(Note updatedNote) async {
    final notes = await getNotes();

    final index = notes.indexWhere((note) => note.id == updatedNote.id);

    if (index == -1) {
      return;
    }

    notes[index] = updatedNote;

    await saveNotes(notes);
  }

  Future<void> deleteNote(String id) async {
    final notes = await getNotes();

    notes.removeWhere((note) => note.id == id);

    await saveNotes(notes);
  }
}
