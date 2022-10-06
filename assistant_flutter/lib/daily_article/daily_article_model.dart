class ArticleInfo {
  int? id;
  String title;
  String abstract;
  String category;
  String link;

  ArticleInfo({
    this.id,
    required this.title,
    required this.abstract,
    required this.category,
    required this.link,
  });

  factory ArticleInfo.fromMap(Map<String, dynamic> json) => ArticleInfo(
        id: json["id"],
        title: json["title"],
        abstract: json["abstract"],
        category: json["category"],
        link: json["link"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "abstract": abstract,
        "category": category,
        "link": link,
      };

  @override
  String toString() {
    return 'ArticleInfo{id: $id, name: $title, category: $category, link: $link}';
  }
}
