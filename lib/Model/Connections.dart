class Connections {
    String groupaffiliation;
    String relatives;

    Connections({this.groupaffiliation, this.relatives});

    factory Connections.fromJson(Map<String, dynamic> json) {
        return Connections(
            groupaffiliation: json['group-affiliation'],
            relatives: json['relatives']
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['group-affiliation'] = this.groupaffiliation;
        data['relatives'] = this.relatives;
        return data;
    }
}