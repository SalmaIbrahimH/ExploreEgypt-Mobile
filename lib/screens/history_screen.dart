import 'dart:ui';
import 'package:explore_egypt/models/article.dart';
import 'package:flutter/material.dart';
import '../services/explore_article.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

ExploreArticle exploreArticle = ExploreArticle();

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Article> articles = [];
  int selectedYearIndex = 0;

  Future getData() async {
    articles = await exploreArticle.getHistoryArticles();
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
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                'Egypt\'s History',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              height: 212.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage(
                    'images/${articles[selectedYearIndex].images[0]}',
                  ),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 4,
                    blurRadius: 5,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 15.0,
                    left: 15.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: BackdropFilter(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
                          child: Text(
                            articles[selectedYearIndex].title,
                            style: TextStyle(
                              fontSize: 36.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        filter: ImageFilter.blur(
                          sigmaX: 19,
                          sigmaY: 19,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                articles[selectedYearIndex].description,
                style: TextStyle(fontSize: 20.0, color: Color(0xFF454545)),
              ),
            ),
            SizedBox(
              width: 150.0,
              child: Card(
                margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        if (selectedYearIndex > 0) {
                          setState(() {
                            selectedYearIndex--;
                          });
                        }
                      },
                      child: Text(
                        'Prev',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 1.0,
                      child: Container(
                        color: Colors.grey,
                        height: 25.0,
                        width: 1.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (selectedYearIndex < articles.length - 1) {
                          setState(() {
                            selectedYearIndex++;
                          });
                        }
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return Center(
        child: SpinKitCircle(
          color: Colors.blue,
          size: 85.0,
        ),
      );
    }
  }
}
