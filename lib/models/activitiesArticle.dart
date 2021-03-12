// To parse this JSON data, do
//
//     final activitiesArticle = activitiesArticleFromJson(jsonString);

import 'dart:convert';

List<ActivitiesArticle> activitiesArticleFromJson(String str) => List<ActivitiesArticle>.from(json.decode(str).map((x) => ActivitiesArticle.fromJson(x)));

String activitiesArticleToJson(List<ActivitiesArticle> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ActivitiesArticle {
    ActivitiesArticle({
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
    String title;
    String coverImg;
    dynamic description;
    dynamic section;
    dynamic dep;
    String content;
    List<String> images;
    String city;

    factory ActivitiesArticle.fromJson(Map<String, dynamic> json) => ActivitiesArticle(
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
