import 'package:bang/Model/Profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Popular{
  List<ComicHero> popularHeroes = [];
  Future<void> getPopular() async{
    List<int> ids = [1,2,3,4,5,6];
    for(int i = 0; i < ids.length; i++){
      PowerStats powerStats;
      Biography biography;
      Appearance appearance;
      Work work;
      Connections connections;
      CharacterImage image;
      String url = "https://superheroapi.com/api/1907388712734798/${ids[i]}";
      var response = await http.get(url);
      var jsondata = jsonDecode(response.body);
      if(jsondata['response'] == 'success'){
        print(jsondata['powerstats']['speed']);
        jsondata['powerstats'].forEach((element){
          powerStats = new PowerStats(
            speed: element['speed'],
            combat: element['combat'],
            durability: element['durability'],
            intelligence: element['intelligence'],
            power: element['power'],
            strength: element['strength']
          );
        });
        jsondata['biography'].forEach((element){
          biography = new Biography(
            alignment: element['alignment'],
            aliases: element['aliases'],
            alteregos: element['alter-egos'],
            firstAppearance: element['first-appearance'],
            fullname: element['full-name'],
            placeOfBirth: element['place-of-birth'],
            publisher: element['publisher']
          );
        });
        jsondata['appearance'].forEach((element){
          appearance = new Appearance(
            height: element['height'],
            eyeColor: element['eye-color'],
            gender: element['gender'],
            hairColor: element['hair-color'],
            race: element['race'],
            weight: element['weight'],
          );
        });
        jsondata['work'].forEach((element){
          work = new Work(
            base: element['base'],
            occupation: element['occupation']
          );
        });
        jsondata['connections'].forEach((element){
          connections = new Connections(
            groupAffliation: element['group-affiliation'],
            relatives: element['relatives'],
          );
        });
      }
      jsondata['image'].forEach((element){
        image = new CharacterImage(
          url: element['url']
        );
      });
      jsondata.forEach((element){
        ComicHero hero = new ComicHero(
          id: element['id'],
          response: element['response'],
          name: element['name'],
          image: image,
          appearance: appearance,
          biography: biography,
          connections: connections,
          powerStats: powerStats,
          work: work,
        );
        popularHeroes.add(hero);
      });
    }
  }

}