import 'package:http/http.dart' as http;
import 'package:bang/Model/CharacterProfile.dart';
import 'dart:convert';
import 'dart:math';

class Popular{
  List<CharacterProfile> popularHeroes = [];
  Future<void> getPopular() async {
    List<int> ids = [69, 620, 644, 263, 306, 641,720,659,346,332,149,78,289,583,233];
    for (int i = 0; i < ids.length; i++) {
      String url = "https://superheroapi.com/api/1907388712734798/${ids[i]}";
      var response = await http.get(url);
      if(response.statusCode == 200){
        CharacterProfile characterProfile = CharacterProfile.fromJson(json.decode(response.body));
        popularHeroes.add(characterProfile);
      }
    }
  }
}
class Villains{
  List<CharacterProfile> popularVil = [];
  Future<void> getPopular() async {
    List<int> ids = [60, 204, 731, 459, 216, 445, 675, 655, 273, 321, 237, 398, 405, 687, 463];
    for (int i = 0; i < ids.length; i++) {
      String url = "https://superheroapi.com/api/1907388712734798/${ids[i]}";
      var response = await http.get(url);
      if(response.statusCode == 200){
        CharacterProfile characterProfile = CharacterProfile.fromJson(json.decode(response.body));
        popularVil.add(characterProfile);
      }
    }
  }
}

class RandomHeroes{
  List<CharacterProfile> randomHeroes = [];
  randomGen(int min, int max){

    var ran = Random();

    var x = ran.nextDouble() * (max - min) + min;

    return x.floor();
  }
  Future<void> getRandom() async
  {
    List<int> randomHeroId = [];
    for(int i = 0; i<10; i++){
      randomHeroId.add(randomGen(1, 700));
    }
    for(int i = 0; i<randomHeroId.length; i++){
      String url = "https://superheroapi.com/api/1907388712734798/${randomHeroId[i]}";
      var response = await http.get(url);
      if(response.statusCode == 200){
        CharacterProfile characterProfile = CharacterProfile.fromJson(json.decode(response.body));
        randomHeroes.add(characterProfile);
      }
    }
  }

}