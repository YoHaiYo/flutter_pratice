class Article {
  String? author;
  String? title;
  String? id;
  String? name;
  String? urltoimage;

  Article({
    required this.author,
    required this.title,
    required this.id,
    required this.name,
    required this.urltoimage,
  });

  factory Article.fromJson(Map<String, dynamic> json){
    return Article(
      author: json["author"],
      title: json["title"],
      urltoimage: json["urlToImage"],
      /// id, name은 source가 상위라서 이렇게 표현
      id: json["source"]["id"],
      name: json["source"]["name"],
    );
  }

  @override
  String toString() {
    return 'Article{author: $author, title: $title, id: $id, name: $name, urlToImage: $urltoimage}';
  }
}
