import 'package:http/http.dart' as http;
import 'package:bang/Model/CharacterProfile.dart';
import 'dart:convert';
class Popular{
  List<CharacterProfile> popularHeroes = [];
  Future<void> getPopular() async {
    List<int> ids = [1, 2, 3, 4, 5, 6];
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