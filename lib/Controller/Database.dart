import 'dart:async';
import 'package:bang/Model/CharacterProfile.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider{
  DatabaseProvider._();

  static final DatabaseProvider instance = DatabaseProvider._();
  static String response = "response";
  static String table = "heroe";
  static String eyecolor = "eyecolor";
  static String gender = "gender";
  static String haircolor = "haircolor";
  static String height;
  static String race = "race";
  static String weight;
  static String aliases;
  static String alignment = "alignment";
  static String alteregos = "alteregos";
  static String firstappearance = "firstappearance";
  static String fullname = "fullname";
  static String placeofbirth = "placeofbirth";
  static String publisher = "publisher";
  static String groupaffiliation = "groupaffiliation";
  static String relatives = "relatives";
  static String url = "url";
  static String combat = "combat";
  static String durability = "durability";
  static String intelligence = "intelligence";
  static String power = "power";
  static String speed = "speed";
  static String strength = "strength";
  static String base = "base";
  static String occupation = "occupation";
  static String id = "id";
  static String name = "name";
  static Database database;

  Future<Database> get db async{
    if(database != null){
      return database;
    }
    database = await initDB();
    return database;
  }

  initDB() async{
    String path = await getDatabasesPath();
    String databasePath = join(path, table);
    var data = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return data;
  }

   _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE $table($id INTEGER PRIMARY KEY,$eyecolor TEXT,$combat TEXT,$power TEXT,$durability TEXT,$speed TEXT,$strength TEXT,$intelligence TEXT, $publisher TEXT,$fullname TEXT,$url TEXT,$relatives TEXT,$groupaffiliation TEXT,$placeofbirth TEXT,$firstappearance TEXT,$alteregos TEXT,$alignment TEXT,$race TEXT,$haircolor TEXT,$gender TEXT,$occupation TEXT,$base TEXT,$name TEXT,$response TEXT)"
    );
  }
  Future<int> save(CharacterProfile characterProfile) async{
    var dbCient = await db;
    Map<String, dynamic> row = {
    DatabaseProvider.eyecolor : characterProfile.appearance.eyecolor,
    DatabaseProvider.combat : characterProfile.powerstats.combat,
    DatabaseProvider.power : characterProfile.powerstats.power,
    DatabaseProvider.durability : characterProfile.powerstats.durability,
    DatabaseProvider.speed : characterProfile.powerstats.speed,
    DatabaseProvider.strength :characterProfile.powerstats.strength,
    DatabaseProvider.intelligence : characterProfile.powerstats.intelligence,
    DatabaseProvider.publisher : characterProfile.biography.publisher,
    DatabaseProvider.fullname : characterProfile.biography.fullname,
    DatabaseProvider.url : characterProfile.image.url,
    DatabaseProvider.relatives :characterProfile.connections.relatives,
    DatabaseProvider.groupaffiliation : characterProfile.connections.groupaffiliation,
    DatabaseProvider.placeofbirth :characterProfile.biography.placeofbirth,
    DatabaseProvider.firstappearance:characterProfile.biography.firstappearance,
    DatabaseProvider.alteregos :characterProfile.biography.alteregos,
    DatabaseProvider.alignment :characterProfile.biography.alignment,
    DatabaseProvider.race : characterProfile.appearance.race,
    DatabaseProvider.haircolor : characterProfile.appearance.haircolor,
    DatabaseProvider.gender : characterProfile.appearance.gender,
    DatabaseProvider.occupation :characterProfile.work.occupation,
    DatabaseProvider.base :characterProfile.work.base,
    DatabaseProvider.name :characterProfile.name,
    DatabaseProvider.id : characterProfile.id
    };
    var res = dbCient.insert(table, row);
    print( await dbCient.query(table));
    return res;
  }
}

