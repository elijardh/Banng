import 'package:bang/Model/Biography.dart';
import 'package:bang/Model/Appearance.dart';
import 'package:bang/Model/Connections.dart';
import 'package:bang/Model/Image.dart';
import 'package:bang/Model/Powerstats.dart';
import 'package:bang/Model/Work.dart';

class CharacterProfile {
    Appearance appearance;
    Biography biography;
    Connections connections;
    String id;
    Image image;
    String name;
    Powerstats powerstats;
    String response;
    Work work;

    CharacterProfile({this.appearance, this.biography, this.connections, this.id, this.image, this.name, this.powerstats, this.response, this.work});

    factory CharacterProfile.fromJson(Map<String, dynamic> json) {
        return CharacterProfile(
            appearance: json['appearance'] != null ? Appearance.fromJson(json['appearance']) : null, 
            biography: json['biography'] != null ? Biography.fromJson(json['biography']) : null, 
            connections: json['connections'] != null ? Connections.fromJson(json['connections']) : null, 
            id: json['id'], 
            image: json['image'] != null ? Image.fromJson(json['image']) : null, 
            name: json['name'], 
            powerstats: json['powerstats'] != null ? Powerstats.fromJson(json['powerstats']) : null, 
            response: json['response'], 
            work: json['work'] != null ? Work.fromJson(json['work']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['name'] = this.name;
        data['response'] = this.response;
        if (this.appearance != null) {
            data['appearance'] = this.appearance.toJson();
        }
        if (this.biography != null) {
            data['biography'] = this.biography.toJson();
        }
        if (this.connections != null) {
            data['connections'] = this.connections.toJson();
        }
        if (this.image != null) {
            data['image'] = this.image.toJson();
        }
        if (this.powerstats != null) {
            data['powerstats'] = this.powerstats.toJson();
        }
        if (this.work != null) {
            data['work'] = this.work.toJson();
        }
        return data;
    }
}