import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final String path = join(await getDatabasesPath(), 'new_database.db');
    return await openDatabase(
      path,
      version: 5,
      onCreate: _createDb,
      onUpgrade: _onUpgrade,
    );
  }
   

  Future<void> _createDb(Database db, int version) async {
     print("Database created with version $version");
    await db.execute('''
      CREATE TABLE my_table (
        id INTEGER PRIMARY KEY,
        name TEXT,
        email TEXT,
        age INTEGER
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 4) {
      await db.execute('ALTER TABLE my_table ADD COLUMN status TEXT DEFAULT \'default_status\';');
       print("Upgraded database to add 'status' column");
    }
  }

  Future<void> updateStatus(int id, String status) async {
    final Database db = await database;
    await db.update(
      'my_table',
      {'status': status},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> dropDatabase() async {
    final String path = join(await getDatabasesPath(), 'new_database.db');
    await deleteDatabase(path);
    _database = null;
  }

  Future<void> insertData(List<Map<String, dynamic>> dataList) async {
    final Database db = await database;
    for (var data in dataList) {
      await db.insert(
        'my_table',
        data,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<Map<String, dynamic>>> getData() async {
    final Database db = await database;
    return await db.query('my_table');
  }
}