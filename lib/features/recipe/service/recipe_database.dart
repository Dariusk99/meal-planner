import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class RecipeDatabase {
  static const String _databaseName = 'meal_planner.db';
  static const int _databaseVersion = 1;

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _openDatabase();

    return _database!;
  }

  Future<Database> _openDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, _databaseName);

    return openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (database, version) async {
        await database.execute(
          '''
          CREATE TABLE recipes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            ingredients TEXT NOT NULL,
            description TEXT NOT NULL
          )
          ''',
        );
      },
    );
  }
}