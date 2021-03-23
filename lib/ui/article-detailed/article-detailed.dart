import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squareboatlalit/model/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailed extends StatelessWidget {
  final Article article;

  const ArticleDetailed(this.article, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                article?.urlToImage != null
                    ? Image.network(article.urlToImage)
                    : Image.asset("assets/sqb.png"),
                Container(
                  color: Colors.black.withOpacity(0.3),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(article?.title?? "NA",
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Theme.of(context).scaffoldBackgroundColor)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(article?.publishedAt ?? "Time",
                      style: Theme.of(context).textTheme.caption),
                  SizedBox(height: 16),
                  Text(article?.description ?? "Discription not available",
                      style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(height: 32),
                  TextButton(
                    child: Text("See full story"),
                    onPressed: () {
                      _launchURL();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL() async {
    await canLaunch(article.url)
        ? await launch(article.url)
        : Get.snackbar(
            null,
            "",
            messageText: Center(
              child: Text(
                "Failed to open",
                style: TextStyle(color: Colors.white),
              ),
            ),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.black,
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10),
          );
  }
}
