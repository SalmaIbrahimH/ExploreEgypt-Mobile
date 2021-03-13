import 'package:explore_egypt/models/article.dart';
import 'package:flutter/material.dart';
import '../services/explore_article.dart';
import '../components/culture_article_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

ExploreArticle exploreArticle = ExploreArticle();

class CultureScreen extends StatefulWidget {
  @override
  _CultureScreenState createState() => _CultureScreenState();
}

class _CultureScreenState extends State<CultureScreen> {
  List<Article> articles = [];
  Future getData() async {
    articles = await exploreArticle.getCultureArticles();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if (articles.length > 0) {
      return Container(
        color: Color(0xFFf7f7f7),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 12.0),
              child: Text(
                'Egypt\'s Culture',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 15.0),
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: List.generate(
                  articles.length,
                  (int index) => CultureArticle(
                    title: articles[index].title,
                    description: articles[index].description,
                    images: articles[index].images,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Color(0xFFeeeeee),
        ),
      );
    }
  }
}
