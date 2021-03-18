import 'package:explore_egypt/localization/localization_constants.dart';
import 'package:explore_egypt/models/article.dart';
import 'package:explore_egypt/services/WishListService.dart';
import 'package:flutter/material.dart';
import '../components/custom_card.dart';

import '../services/explore_article.dart';

ExploreArticle exploreArticle = ExploreArticle();

class FactsScreen extends StatefulWidget {
  @override
  _FactsScreenState createState() => _FactsScreenState();
}

class _FactsScreenState extends State<FactsScreen> {
  List<Article> articles = [];
  var name;
  getData() async {
    var data = await exploreArticle.getFactsArticles();
    articles = data;
    setState(() {});
  }

  // Future getData() async {
  //   print('test');
  //   articles = await exploreArticle.getFactsArticles();
  //   print('test');
  //   setState(() {});
  //   print('testtt');
  // }
  getFav(id) async {
    bool res = await WishListService().isFav(id, 8, "explorDep");
    if (res) {
      return true;
    }
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
                getTranslated(context, 'quick_facts'),
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Column(
              children: List.generate(
                articles.length,
                (int index) => CustomCard(
                  img: articles[index].images[0],
                  title: articles[index].title,
                  description: articles[index].description,
                  // name != null ? icon: Icon(Icons.favorite_outline)
                  // icon: Icon(Icons.favorite_outline),
                ),
              ),
            ),
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
