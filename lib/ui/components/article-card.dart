import 'package:flutter/material.dart';
import 'package:squareboatlalit/model/article.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard(this.article, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: ListTile(
          title: Text(article?.title ?? "",
              style: Theme.of(context).textTheme.bodyText1),
          subtitle: Text("source: ${article?.source?.name ?? "NA"}"),
          trailing: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: article?.urlToImage != null
                  ? Image.network(article.urlToImage)
                  : Image.asset("assets/sqb.png")),
        ),
      ),
    );
  }
}
