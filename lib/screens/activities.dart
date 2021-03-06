import 'dart:ui';
import 'package:explore_egypt/localization/localization_constants.dart';
import 'package:explore_egypt/models/activitiesArticle.dart';
import 'package:explore_egypt/screens/article.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../services/articleService.dart';

class Activities extends StatefulWidget {
  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  final _pageController = PageController(viewportFraction: 0.877);
  // ignore: deprecated_member_use
  List<ActivitiesArticles> articles = new List();
  double currentPage = 0;
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  @override
  void initState() {
    getArticlesFromsServer();
    //  _pageController.addListener((){
    //   setState(() {
    //     currentPage = _pageController.page;
    //   });
    // });
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getArticlesFromsServer() async {
    articles = await ArticleService().getArticles();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (articles.length > 0) {
      return SafeArea(
          child: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            AnimatedOpacity(
              duration: const Duration(milliseconds: 50),
              opacity: closeTopContainer ? 0 : 1,
              child: AnimatedContainer(
                width: size.width,
                alignment: Alignment.topCenter,
                height: closeTopContainer ? 0 : size.height * 0.50,
                duration: const Duration(milliseconds: 50),
                child: Column(
                  children: [
                    Container(
                      height: 218.4,
                      margin: EdgeInsets.only(top: 16),
                      child: PageView(
                        physics: BouncingScrollPhysics(),
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          4,
                          (int index) => FittedBox(
                            fit: BoxFit.fill,
                            alignment: Alignment.topCenter,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Article(article: articles[index])));
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 28.8),
                                width: 333.6,
                                height: 218.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9.6),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/' +
                                        articles[index].img.toString()),
                                  ),
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      bottom: 19,
                                      right: 6,
                                      left: 6,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(4.8),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaY: 1, sigmaX: 1),
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: 2, right: 2),
                                            alignment: Alignment.centerLeft,
                                            child: Wrap(
                                              children: <Widget>[
                                                Text(
                                                  articles[index]
                                                      .title
                                                      .toString(),
                                                  style: GoogleFonts.lato(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white,
                                                      fontSize: 22),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 28.8, top: 28.8),
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 4,
                        effect: ExpandingDotsEffect(
                            activeDotColor: Color(0xFF8a8a8a),
                            dotColor: Color(0xFFababab),
                            dotHeight: 4.8,
                            dotWidth: 6,
                            spacing: 6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1),
              child: Center(
                child: Text(
                  getTranslated(context, 'explore_top'),
                  style: GoogleFonts.lato(
                      fontSize: 30.6, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10),
                height: 440,
                child: Container(
                  child: ListView.builder(
                      itemCount: articles.length,
                      controller: controller,
                      padding: EdgeInsets.only(left: 28.8, right: 12),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Article(article: articles[index])));
                          },
                          child: Container(
                            height: 150,
                            width: size.width,
                            margin: EdgeInsets.only(
                              right: 16.8,
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(
                                    'assets/' + articles[index].img.toString(),
                                    height: 110,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0, right: 12.0),
                                      child: Text(articles[index].title,
                                          overflow: TextOverflow.clip,
                                          style: GoogleFonts.lato(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black))),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ))
          ],
        ),
      ));
    } else {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Color(0xFFeeeeee),
        ),
      );
    }
  }
}
