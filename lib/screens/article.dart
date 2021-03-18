import 'dart:ui';

import 'package:explore_egypt/models/activitiesArticle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Article extends StatefulWidget {
  final ActivitiesArticles article;
  Article({Key key, @required this.article}) : super(key: key);

  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  Widget build(BuildContext context) {
    print(widget.article.content.length);
    print(widget.article.content[1]);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: Card(
            child: ListView(children: [
          Container(
            width: width,
            height: height * .56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/' + widget.article.img.toString()),
              ),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: 15,
                    left: 15,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 42,
                          color: Colors.white,
                        ))),
                Positioned(
                  top: 260,
                  right: 10,
                  left: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.8),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 1, sigmaX: 1),
                      child: Container(
                        padding: EdgeInsets.only(left: 2, right: 2),
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(bottom: 20),
                        child: Wrap(
                          children: <Widget>[
                            Text(
                              widget.article.title.toString(),
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 28),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
              child: Padding(
            padding:
                const EdgeInsets.only(top: 25, bottom: 15, left: 15, right: 15),
            child: Text(
              widget.article.description.toString(),
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 20),
            ),
          )),
          for (var i = 0; i < widget.article.content.length; i++)
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
              child: Text(
                widget.article.content[i],
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 15),
              ),
            ),
          Padding(padding: EdgeInsets.only(bottom: 20))
        ])),
      ),
    );
  }
}
