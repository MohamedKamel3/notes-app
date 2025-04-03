import 'package:notes_app/DataBase/note_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlHelper {
  static Database? database;

  static getDatabase() async {
    if (database == null) {
      database = await initDB();
      return database;
    } else {
      return database;
    }
  }

  static initDB() async {
    String path = join(await getDatabasesPath(), 'notes.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        Batch batch = db.batch();
        batch.execute('''
        CREATE TABLE notes(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          desc TEXT,
          date TEXT,
          color INTEGER
        )
       ''');
        batch.commit();
      },
    );
  }

  // add Note
  addNote(Notes note) async {
    Database db = await getDatabase();
    await db.insert('notes', note.toMap());
  }

  // get all Notes
  Future<List<Map>> getNotes() async {
    Database db = await getDatabase();
    return await db.query('notes');
  }

  // update Note
  updateNote(Notes note) async {
    Database db = await getDatabase();
    await db.update('notes', note.toMap(), where: 'id=?', whereArgs: [note.id]);
  }

  // second update Note
  updateNoteBatch(Notes note) async {
    Database db = await getDatabase();
    Batch batch = db.batch();
    batch.update('notes', note.toMap(), where: 'id=?', whereArgs: [note.id]);
    batch.commit();
  }

  // delete Note
  deleteNote(int id) async {
    Database db = await getDatabase();
    await db.delete('notes', where: 'id=?', whereArgs: [id]);
  }

  // second delete Note
  deleteNoteBatch(int id) async {
    Database db = await getDatabase();
    Batch batch = db.batch();
    batch.delete('notes', where: 'id=?', whereArgs: [id]);
    batch.commit();
  }

  // delete all Notes
  deleteAllNotes() async {
    Database db = await getDatabase();
    await db.delete('notes');
  }
}
