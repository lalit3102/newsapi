import 'package:json_annotation/json_annotation.dart';
import 'package:squareboatlalit/model/source.dart';

part 'article.g.dart';

@JsonSerializable()
class Article{

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article();
  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}