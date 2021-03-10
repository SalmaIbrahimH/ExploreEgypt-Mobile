
import 'dart:convert';

List<Article> articleFromJson(String str) => List<Article>.from(json.decode(str).map((x) => Article.fromJson(x)));

String articleToJson(List<Article> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Article {
    Article({
        this.id,
        this.title,
        this.coverImg,
        this.description,
        this.section,
        this.dep,
        this.content,
        this.images,
        this.city,
    });

    int id;
    dynamic title;
    dynamic coverImg;
    dynamic description;
    dynamic section;
    dynamic dep;
    String content;
    List<String> images;
    String city;

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["id"],
        title: json["title"],
        coverImg: json["img"],
        description: json["description"],
        section: json["section"],
        dep: json["dep"],
        content: json["content"] == null ? null : json["content"],
        images: List<String>.from(json["Images"].map((x) => x)),
        city: json["city"] == null ? null : json["city"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "img": coverImg,
        "description": description,
        "section": section,
        "dep": dep,
        "content": content == null ? null : content,
        "Images": List<dynamic>.from(images.map((x) => x)),
        "city": city == null ? null : city,
    };
}
