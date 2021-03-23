import 'package:json_annotation/json_annotation.dart';

import 'article.dart';

part 'news-model.g.dart';

@JsonSerializable()
class NewsModel {
  String status;
  int totalResults;
  List<Article> articles;

  NewsModel();

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
