import 'package:hive_flutter/hive_flutter.dart';
import '../model/note_model.dart';

class HiveDBHelper {
  static const String _boxName = 'notesBox';

  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NoteAdapter());
    await Hive.openBox<Note>(_boxName);
  }

  static Box<Note> getNotesBox() => Hive.box<Note>(_boxName);
}
