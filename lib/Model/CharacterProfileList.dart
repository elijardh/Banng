import 'CharacterProfile.dart';

class CharacterProfileList {
    String response;
    List<CharacterProfile> results;
    String results_for;

    CharacterProfileList({this.response, this.results, this.results_for});

    factory CharacterProfileList.fromJson(Map<String, dynamic> json) {
        return CharacterProfileList(
            response: json['response'], 
            results: json['results'] != null ? (json['results'] as List).map((i) => CharacterProfile.fromJson(i)).toList() : null,
            results_for: json['results-for'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['response'] = this.response;
        data['results-for'] = this.results_for;
        if (this.results != null) {
            data['results'] = this.results.map((v) => v.toJson()).toList();
        }
        return data;
    }
}