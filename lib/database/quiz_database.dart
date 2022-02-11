import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:quiz_app/models/users_model.dart';


class QuizDatabase {
  static final QuizDatabase instance = QuizDatabase._init();

  static Database? _database;

  QuizDatabase._init();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDB('quiz.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableNotes ( 
  ${UserFields.id} $idType, 
  ${UserFields.isImportant} $boolType,
  ${UserFields.number} $integerType,
  ${UserFields.title} $textType,
  ${UserFields.description} $textType,
  ${UserFields.time} $textType
  )
''');
  }

  Future<UsersModel> create(UsersModel note) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db!.insert(tableNotes, note.toJson());
    return note.copy(id: id);
  }

  Future<UsersModel> readNote(int id) async {
    final db = await instance.database;

    final maps = await db!.query(
      tableNotes,
      columns: UserFields.values,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return UsersModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<UsersModel>> readAllNotes() async {
    final db = await instance.database;

    final orderBy = '${UserFields.time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db!.query(tableNotes, orderBy: orderBy);

    return result.map((json) => UsersModel.fromJson(json)).toList();
  }

  Future<int> update(UsersModel note) async {
    final db = await instance.database;

    return db!.update(
      tableNotes,
      note.toJson(),
      where: '${UserFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db!.delete(
      tableNotes,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db!.close();
  }
}
