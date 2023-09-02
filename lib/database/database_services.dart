import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:student_form/class_model/class_values.dart';

class DatabaseServices {
  Database? database;




  Future<void> initDatabase() async {
    database = await openDatabase(join(await getDatabasesPath(), 'student.db'),
        version: 2, onCreate: (Database db, int version) async {
      return db.execute(
          'CREATE TABLE Student(name TEXT,email TEXT,phno INTEGER,dob TEXT,blood TEXT)');
    });

  }

  Future<void> insertStudents(Values values) async {
    await database?.insert('Student', values.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Values>> details() async {
    final db = database;
    final List<Map<String, dynamic>> maps = await db!.query('Student');
    return List.generate(maps.length, (index) {
      return Values(
          name: maps[index]['name'],
          email: maps[index]['email'],
          phno: maps[index]['phno'],
          dob: maps[index]['dob'],
          blood: maps[index]['blood']);
    });

  }
  Future<int?>deleteTable(String name)async {
    final db= database;
    return db!.delete('Student',where: 'name =?',whereArgs: [name]);
  }
  Future<int?> update(Values values) async {
    final db= database;
    return await db?.update('Student', values.toMap(),
      where: 'email=?',whereArgs: [values.email]
       );
  }

}
