import 'package:flutter/material.dart';
import 'package:squareboatlalit/model/article.dart';
import 'package:squareboatlalit/ui/components/article-card.dart';
import 'package:squareboatlalit/ui/components/empty-screen.dart';

class SearchPage extends SearchDelegate {
  final List<Article> articles;

  SearchPage(this.articles);

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Article> list = [];
    if (articles != null) {
      for (var v in articles) {
        String title = v.title?? "";
        String dis = v.description?? "";
        if (title.contains(query) || dis.contains(query)) {
          list.add(v);
        }
      }
    }
    if (list.isNotEmpty) {
      return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ArticleCard(list[index]);
          });
    } else {
      return EmptyScreen();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[];
  }
}
