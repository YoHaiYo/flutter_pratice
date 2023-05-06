import 'article.dart';

class JsonModel {
  String? status;
  int? totalResults;
  List<Article> articles;

  JsonModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  /// map형식의 데이터를 받아서 JsonModel 클래스로 만들어주는 함수
  /// Map<String, dynamic> json => String : Map, dynamic : value

  factory JsonModel.fromJson(Map<String, dynamic> json) {

    return JsonModel(
      status: json["staus"],
      totalResults: json["totalResults"],
      /// articles key의 데이터들 받기
      articles: json["articles"]
      // map<Article> : 리스트의 타입을 Article로 한다.
      .map<Article>((element) => Article.fromJson(element))
      // 리스트 타입으로 만든다.
      .toList(),
    );
  }

  @override
  String toString() {
    return 'JsonModel{status: $status, totalResults: $totalResults, articles: $articles}';
  }
}
