class Image {
    String url;

    Image({this.url});

    factory Image.fromJson(Map<String, dynamic> json) {
        return Image(
            url: json['url'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['url'] = this.url;
        return data;
    }
}