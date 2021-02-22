import 'dart:async';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:bang/Model/CharacterProfile.dart';
import 'dart:convert';
import 'dart:math';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Popular {

  Future<List<CharacterProfile>> getPopular() async {
    List<CharacterProfile> popularHeroes = [];
    List<int> ids = [
      69,
      620,
      644,
      263,
      306,
      641,
      720,
      659,
      346,
      332,
      149,
      78,
      289,
      583,
      233
    ];
    for (int i = 0; i < ids.length; i++) {
      String url = "https://superheroapi.com/api/1907388712734798/${ids[i]}";
      var response = await http.get(url);
      if (response.statusCode == 200) {
        CharacterProfile characterProfile =
            CharacterProfile.fromJson(json.decode(response.body));
        popularHeroes.add(characterProfile);
      }
    }
    return popularHeroes;
  }
}

class Villains extends ChangeNotifier {
  List<CharacterProfile> popularVil = [];

  getPopVil() {
    return popularVil;
  }

  setPopVil(List<CharacterProfile> data) {
    popularVil = data;
    notifyListeners();
  }

  Future<List<CharacterProfile>> getPopular() async {
    List<CharacterProfile> popvil = [];
    List<int> ids = [
      60,
      204,
      731,
      453,
      216,
      445,
      675,
      655,
      273,
      321,
      237,
      398,
      405,
      687,
      463
    ];
    for (int i = 0; i < ids.length; i++) {
      String url = "https://superheroapi.com/api/1907388712734798/${ids[i]}";
      var response = await http.get(url);
      if (response.statusCode == 200) {
        CharacterProfile characterProfile =
            CharacterProfile.fromJson(json.decode(response.body));
        popvil.add(characterProfile);
      }
    }
    return popvil;
  }
}

class RandomHeroes{
  List<CharacterProfile> randomHeroes = [];

  getRanChar() {
    return randomHeroes;
  }


  randomGen(int min, int max) {
    var ran = Random();

    var x = ran.nextDouble() * (max - min) + min;

    return x.floor();
  }

  Future<List<CharacterProfile>> getRandom() async {
    List<int> randomHeroId = [];
    List<CharacterProfile> randomHeroList = [];
    for (int i = 0; i < 10; i++) {
      randomHeroId.add(randomGen(1, 700));
    }
    for (int i = 0; i < randomHeroId.length; i++) {
      String url =
          "https://superheroapi.com/api/1907388712734798/${randomHeroId[i]}";
      var response = await http.get(url);
      if (response.statusCode == 200) {
        CharacterProfile characterProfile = CharacterProfile.fromJson(json.decode(response.body));
        randomHeroList.add(characterProfile);
      }
    }
    return randomHeroList;
  }
}

/*class DatabaseProvider extends ChangeNotifier {
  DatabaseProvider._();

  static final DatabaseProvider instance = DatabaseProvider._();

  String eyecolor = 'eyecolor';
  String gender = 'gender';
  String haircolor = 'haircolor';

  //List<String> height;
  String race = 'race';

  //List<String> weight;
  //List<String> aliases;
  String alignment = 'alignment';
  String alteregos = 'alteregos';
  String firstappearance = 'firstappearance';
  String fullname = 'fullname';
  String placeofbirth = 'placeofbirth';
  String publisher = 'publisher';
  String groupaffiliation = 'groupaffiliation';
  String relatives = 'relatives';
  String url = 'url';
  String combat = 'combat';
  String durability = 'durability';
  String intelligence = 'intelligence';
  String power = 'power';
  String speed = 'speed';
  String strength = 'strength';
  String base = 'base';
  String occupation = 'occupation';
  String id = 'apiid';
  String name = 'name';

  static Database db;

  Future<Database> get getDb async {
    if (db != null) {
      return db;
    }
    db = await initDB();
    return db;
  }

  Future<Database> initDB() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, "sav.db");

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        '''CREATE TABLE Sav(id INTEGER PRIMARY KEY,
        $eyecolor TEXT,
        $combat TEXT,
        $power TEXT,
        $durability TEXT,
        $speed TEXT,
        $strength TEXT,
        $intelligence TEXT,
        $publisher TEXT,
        $fullname TEXT,
        $url TEXT,
        $relatives TEXT,
        $groupaffiliation TEXT,
        $placeofbirth TEXT,
        $firstappearance TEXT,
        $alteregos TEXT,
        $alignment TEXT,
        $race TEXT,
        $haircolor TEXT,
        $gender TEXT,
        $occupation TEXT,
        $base TEXT,
        $name TEXT,
        $id TEXT
        )''');
  }

  Future<int> saveCharacter(CharacterProfile characterProfile) async {
    //var dbClient = this.db;
    //var result = await dbClient.rawInsert('INSERT INTO saved($eyecolor, $combat, $power, $durability, $speed, $strength, $intelligence,$publisher,$fullname,$url,$relatives,$groupaffiliation,$placeofbirth, $firstappearance, $alteregos, $alignment, $race, $haircolor , $gender, $occupation, $base, $name, $id)''VALUES(${characterProfile.appearance.eyecolor},${characterProfile.powerstats.combat},${characterProfile.powerstats.power},${characterProfile.powerstats.durability},${characterProfile.powerstats.speed},${characterProfile.powerstats.strength},${characterProfile.powerstats.intelligence},${characterProfile.biography.publisher},${characterProfile.biography.fullname},${characterProfile.image.url},${characterProfile.connections.relatives},${characterProfile.connections.groupaffiliation},${characterProfile.biography.placeofbirth},${characterProfile.biography.firstappearance},${characterProfile.biography.alteregos},${characterProfile.biography.alignment},${characterProfile.appearance.race},${characterProfile.appearance.haircolor},${characterProfile.appearance.gender},${characterProfile.work.occupation},${characterProfile.work.base},${characterProfile.name}, ${characterProfile.id})');
    //client.rawInsert('INSERT INTO Saved( $name )VALUES(${characterProfile.name})')

    var client = await instance.getDb;
    print(client.toString());
    var res = await client.rawInsert(
        '''INSERT INTO Saved($name)
        VALUES(${characterProfile.name})''');
    return res;
  }

  Future <List<Map<String, dynamic>>> getSavedChar() async {
    var dbClient = db;
    var res = dbClient.query('saved');
    return res;
  }

  Future<List<CharacterProfile>> getItAll() async{
    var list = await getSavedChar();

    int count = list.length;

    List<CharacterProfile> charList = new List<CharacterProfile>();

    for(int i = 0; i< count; i++){
      charList.add(CharacterProfile.fromJson(list[i]));
    }
    return charList;
  }
}*/
