class Powerstats {
    String combat;
    String durability;
    String intelligence;
    String power;
    String speed;
    String strength;

    Powerstats({this.combat, this.durability, this.intelligence, this.power, this.speed, this.strength});

    factory Powerstats.fromJson(Map<String, dynamic> json) {
        return Powerstats(
            combat: json['combat'], 
            durability: json['durability'], 
            intelligence: json['intelligence'], 
            power: json['power'], 
            speed: json['speed'], 
            strength: json['strength'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['combat'] = this.combat;
        data['durability'] = this.durability;
        data['intelligence'] = this.intelligence;
        data['power'] = this.power;
        data['speed'] = this.speed;
        data['strength'] = this.strength;
        return data;
    }
}