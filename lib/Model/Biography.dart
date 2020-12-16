class Biography {
    List<String> aliases;
    String alignment;
    String alteregos;
    String firstappearance;
    String fullname;
    String placeofbirth;
    String publisher;

    Biography({this.aliases, this.alignment, this.alteregos, this.firstappearance, this.fullname, this.placeofbirth, this.publisher});

    factory Biography.fromJson(Map<String, dynamic> json) {
        return Biography(
            aliases: json['aliases'] != null ? new List<String>.from(json['aliases']) : null, 
            alignment: json['alignment'], 
            alteregos: json['alter-egos'],
            firstappearance: json['first-appearance'],
            fullname: json['full-name'],
            placeofbirth: json['place-of-birth'],
            publisher: json['publisher'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['alignment'] = this.alignment;
        data['alter-egos'] = this.alteregos;
        data['first-appearance'] = this.firstappearance;
        data['full-name'] = this.fullname;
        data['place-of-birth'] = this.placeofbirth;
        data['publisher'] = this.publisher;
        if (this.aliases != null) {
            data['aliases'] = this.aliases;
        }
        return data;
    }
}