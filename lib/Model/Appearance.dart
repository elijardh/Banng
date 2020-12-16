class Appearance {
    String eyecolor;
    String gender;
    String haircolor;
    List<String> height;
    String race;
    List<String> weight;

    Appearance({this.eyecolor, this.gender, this.haircolor, this.height, this.race, this.weight});

    factory Appearance.fromJson(Map<String, dynamic> json) {
        return Appearance(
            eyecolor: json['eye-color'],
            gender: json['gender'], 
            haircolor: json['hair-color'],
            height: json['height'] != null ? new List<String>.from(json['height']) : null, 
            race: json['race'], 
            weight: json['weight'] != null ? new List<String>.from(json['weight']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['eye-color'] = this.eyecolor;
        data['gender'] = this.gender;
        data['hair-color'] = this.haircolor;
        data['race'] = this.race;
        if (this.height != null) {
            data['height'] = this.height;
        }
        if (this.weight != null) {
            data['weight'] = this.weight;
        }
        return data;
    }
}