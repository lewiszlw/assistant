class ArticleInfo {
  int? id;
  String title;
  String abstract;
  String category;
  String link;
  String source;

  ArticleInfo({
    this.id,
    required this.title,
    required this.abstract,
    required this.category,
    required this.link,
    required this.source,
  });

  factory ArticleInfo.fromMap(Map<String, dynamic> json) => ArticleInfo(
        id: json["id"],
        title: json["title"],
        abstract: json["abstract"],
        category: json["category"],
        link: json["link"],
        source: json["source"]
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "abstract": abstract,
        "category": category,
        "link": link,
        "source": source,
      };

  @override
  String toString() {
    return 'ArticleInfo{id: $id, name: $title, category: $category, link: $link, source: $source}';
  }
}
