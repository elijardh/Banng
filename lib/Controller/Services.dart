import 'dart:async';
import 'dart:core';

import 'package:bang/Model/CharacterProfileList.dart';
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

class Villains {
  List<CharacterProfile> popularVil = [];

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

class SearchCharacter{


  Future<CharacterProfileList> getCharacter(String charName) async{
    CharacterProfileList _characterProfileList = new CharacterProfileList();
    String url = "https://superheroapi.com/api/1907388712734798/search/$charName";
    var response = await http.get(url);
    if(response.statusCode == 200){
      _characterProfileList = CharacterProfileList.fromJson(json.decode(response.body));
    }
    return _characterProfileList;
  }
}
