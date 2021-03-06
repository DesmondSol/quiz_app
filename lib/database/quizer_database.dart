import 'package:path/path.dart';
import 'package:quiz_app/models/app_users_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:quiz_app/models/Questions_model.dart';

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
CREATE TABLE $tableUsers ( 
  ${UserField.id} $idType, 
  ${UserField.name} $textType,
  ${UserField.email} $textType,
  ${UserField.password} $textType,
  ${UserField.phone} $integerType,
  ${UserField.time} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableQuestion ( 
  ${QuestionField.id} $idType, 
  ${QuestionField.author} $textType,
  ${QuestionField.description} $textType,
  ${QuestionField.question} $textType,
  ${QuestionField.choice_a} $textType,
  ${QuestionField.choice_b} $textType,
  ${QuestionField.choice_c} $textType,
  ${QuestionField.choice_d} $textType,
  ${QuestionField.answer} $textType,
  ${QuestionField.tags} $textType
  )
''');
  }

  Future<AppUsersModel> create(AppUsersModel user) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db!.insert(tableUsers, user.toJson());
    return user.copy(id: id);
  }

  Future<AppUsersModel> readUser(int id) async {
    final db = await instance.database;

    final maps = await db!.query(
      tableUsers,
      columns: UserField.values,
      where: '${UserField.id} = ?', //sql injection fix
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return AppUsersModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<AppUsersModel>> readAllUsers() async {
    final db = await instance.database;

    final orderBy = '${UserField.time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db!.query(tableUsers, orderBy: orderBy);

    return result.map((json) => AppUsersModel.fromJson(json)).toList();
  }

  Future<int> update(AppUsersModel user) async {
    final db = await instance.database;

    return db!.update(
      tableUsers,
      user.toJson(),
      where: '${UserField.id} = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db!.delete(
      tableUsers,
      where: '${UserField.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db!.close();
  }
}
