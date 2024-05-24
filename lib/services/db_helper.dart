import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//This class provides methods for creating and opening the database, as well as inserting and querying data.
class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }
  
 
  //initializing database
  Future<Database> initDatabase() async {
    //join func ak directory create kar k usko database name k sath join kardeta
    String path = join(await getDatabasesPath(), 'my_database.db');
    return await openDatabase(path, version: 7, onCreate: createDb);
    //onCreate m _createDb func ka reference dia h jo nechay h.
  }

  //Create m database ka schema define karengay
  Future<void> createDb(Database db, int version) async {
    await db.execute(
      //3 dotted lines means all data in string format
      '''
      CREATE TABLE muzammil_table (
        columnid INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        email TEXT,
        status TEXT,
        age INTEGER,
        height REAL
      
      )
    '''
    );
  }
  
  //inserting or create method
  Future<int> insertData(Map<String, dynamic> row) async {
    //create database and store it in db
    Database db = await database;
    return await db.insert('muzammil_table', row);
    //createDb func m  jo table create kia tha muzammil_table name s wo yaha pass kia row k sath
  }
  
  // querying or read method
  //data read karnay m time lagsakta is liay future
  Future<List<Map<String, dynamic>>> queryData() async {
    Database db = await database;
    return await db.query('muzammil_table');
  }

  //update method
    Future<int> updateData(Map<String, dynamic> row) async {
    Database db = await database;
    //creating id and gettin columnid from row. using this id in whereArgs parameter
    int id = row['columnid'];
    //where is what you want to update
    return await db.update('muzammil_table', row, where: 'columnid = ?', whereArgs: [id]);
  }

  //delete method
  Future<int> deleteData(int id) async {
    Database db = await database;
    return await db.delete('muzammil_table', where: 'columnid = ?', whereArgs: [id]);
  }

  // Add functions to perform CRUD operations here
}
