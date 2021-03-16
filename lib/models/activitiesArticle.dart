
import 'dart:convert';

List<ActivitiesArticles> activitiesArticlesFromJson(String str) => List<ActivitiesArticles>.from(json.decode(str).map((x) => ActivitiesArticles.fromJson(x)));

String activitiesArticlesToJson(List<ActivitiesArticles> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ActivitiesArticles {
    ActivitiesArticles({
        this.title,
        this.description,
        this.img,
        this.section,
        this.content,
        this.images,
        this.dep,
        this.city,
        this.id,
    });

    String title;
    String description;
    dynamic img;
    Section section;
    List<String> content;
    List<String> images;
    dynamic dep;
    String city;
    int id;

    factory ActivitiesArticles.fromJson(Map<String, dynamic> json) => ActivitiesArticles(
        title: json["title"],
        description: json["description"],
        img: json["img"],
        section: sectionValues.map[json["section"]],
        content: List<String>.from(json["content"].map((x) => x)),
        images: List<String>.from(json["Images"].map((x) => x)),
        dep: json["dep"],
        city: json["city"] == null ? null : json["city"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "img": img,
        "section": sectionValues.reverse[section],
        "content": List<dynamic>.from(content.map((x) => x)),
        "Images": List<dynamic>.from(images.map((x) => x)),
        "dep": dep,
        "city": city == null ? null : city,
        "id": id,
    };
}

enum Section { EXPLORE_TOP_ATTRACTIONS, KEEP_UP_WITH_THE_NEW }

final sectionValues = EnumValues({
    "Explore top attractions": Section.EXPLORE_TOP_ATTRACTIONS,
    "Keep up with the new": Section.KEEP_UP_WITH_THE_NEW
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
