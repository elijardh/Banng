class Work {
    String base;
    String occupation;

    Work({this.base, this.occupation});

    factory Work.fromJson(Map<String, dynamic> json) {
        return Work(
            base: json['base'], 
            occupation: json['occupation'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['base'] = this.base;
        data['occupation'] = this.occupation;
        return data;
    }
}