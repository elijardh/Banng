import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:bang/Model/CharacterProfile.dart';
import 'dart:convert';
import 'dart:math';

class Popular extends ChangeNotifier{

  List<CharacterProfile> popHeroes = [];

  getPopHero(){
    return popHeroes;
  }

  setPopHero(List<CharacterProfile> data){
    popHeroes = data;
    notifyListeners();
  }


  Future<List<CharacterProfile>> getPopular() async {
    List<CharacterProfile> popularHeroes = [];
    List<int> ids = [69, 620, 644, 263, 306, 641,720,659,346,332,149,78,289,583,233];
    for (int i = 0; i < ids.length; i++) {
      String url = "https://superheroapi.com/api/1907388712734798/${ids[i]}";
      var response = await http.get(url);
      if(response.statusCode == 200){
        CharacterProfile characterProfile = CharacterProfile.fromJson(json.decode(response.body));
        popularHeroes.add(characterProfile);
      }
    }
    return popularHeroes;
  }
}
class Villains extends ChangeNotifier{
  List<CharacterProfile> popularVil = [];

  getPopVil(){
    return popularVil;
  }

  setPopVil(List<CharacterProfile> data){
    popularVil = data;
    notifyListeners();
  }


  Future<List<CharacterProfile>> getPopular() async {
    List<CharacterProfile> popvil = [];
    List<int> ids = [60, 204, 731, 459, 216, 445, 675, 655, 273, 321, 237, 398, 405, 687, 463];
    for (int i = 0; i < ids.length; i++) {
      String url = "https://superheroapi.com/api/1907388712734798/${ids[i]}";
      var response = await http.get(url);
      if(response.statusCode == 200){
        CharacterProfile characterProfile = CharacterProfile.fromJson(json.decode(response.body));
        popvil.add(characterProfile);
      }
    }
    return popvil;
  }
}

class RandomHeroes extends ChangeNotifier{
  List<CharacterProfile> randomHeroes = [];
  getRanChar(){
    return randomHeroes;
  }

  setRanChar(List<CharacterProfile> data){
    randomHeroes = data;
    notifyListeners();
  }

  randomGen(int min, int max){

    var ran = Random();

    var x = ran.nextDouble() * (max - min) + min;

    return x.floor();
  }
  Future<List<CharacterProfile>> getRandom() async
  {
    List<CharacterProfile> randCha = [];
    List<int> randomHeroId = [];
    for(int i = 0; i<10; i++){
      randomHeroId.add(randomGen(1, 700));
    }
    for(int i = 0; i<randomHeroId.length; i++){
      String url = "https://superheroapi.com/api/1907388712734798/${randomHeroId[i]}";
      var response = await http.get(url);
      if(response.statusCode == 200){
        CharacterProfile characterProfile = CharacterProfile.fromJson(json.decode(response.body));
        randCha.add(characterProfile);
      }
    }
    return randCha;
  }

}