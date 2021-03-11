class Article {
  Article({
    this.id,
    this.page,
    this.name,
    this.title,
    this.description,
    this.images,
  });

  int id;
  String page;
  String name;
  String title;
  String description;
  List<String> images;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["id"],
        page: json["page"],
        name: json["name"],
        title: json["title"],
        description: json["description"],
        images: List<String>.from(json["Images"].map((x) => x)),
      );
}
