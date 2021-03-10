import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:explore_egypt/models/article.dart';
import 'package:explore_egypt/models/beach_model.dart';
import 'package:explore_egypt/widgets/custom_tab_indicator.dart';
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
  List<Article> articles = new List();
  double currentPage = 0;


  @override
  void initState() {
    getArticlesFromsServer();
    //  _pageController.addListener((){
  //   setState(() {
  //     currentPage = _pageController.page;
  //   });
  // });
  super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getArticlesFromsServer() async {
    articles = await ArticleService().getArticles();
    debugPrint(articles[1].coverImg.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            height: 30,
            margin: EdgeInsets.only(left: 14.4, top: 28.8),
            child: DefaultTabController(
                length: 8,
                child: TabBar(
                  labelStyle: GoogleFonts.lato(fontSize: 20),
                  labelColor: Colors.blueGrey[500],
                  unselectedLabelColor: Colors.blueGrey[100],
                  indicatorPadding:
                      EdgeInsets.only(left: 14.4, right: 14.4, top: 20),
                  isScrollable: true,
                  indicatorColor: Colors.blueGrey[500],
                  indicator: RoundedRectangleTabIndicator(
                      color: Color(0xFF000000), weight: 2.4, width: 60),
                  tabs: [
                    Tab(
                      child: Container(
                        child: Text('New & Trending'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text('Sights & Attractions'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text('Experiences'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text('Arts & Culture'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text('Shopping'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text('Food & Drink'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text('Spas & Wellness'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text('Itineraries'),
                      ),
                    ),
                  ],
                )),
          ),
          Container(
            height: 218.4,
            margin: EdgeInsets.only(top: 16),
            child: PageView(
              physics: BouncingScrollPhysics(),
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                articles.length,
                (int index) => Container(
                  margin: EdgeInsets.only(right: 28.8),
                  width: 333.6,
                  height: 218.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.6),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          'assets/' + articles[index].coverImg.toString()),
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 19,
                        right: 6,
                        left: 6,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4.8),
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaY: 1, sigmaX: 1),
                            child: Container(
                              padding: EdgeInsets.only(left: 2, right: 2),
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                children: <Widget>[
                                  Text(
                                    articles[index].title.toString(),
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w700,
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
            Padding(
                padding: EdgeInsets.only(left: 28.8, top: 28.8),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: articles.length,
                  effect: ExpandingDotsEffect(
                      activeDotColor: Color(0xFF8a8a8a),
                      dotColor: Color(0xFFababab),
                      dotHeight: 4.8,
                      dotWidth: 6,
                      spacing: 6),
                    
                ),
              ),
          Padding(
            padding: EdgeInsets.only(top: 48, left: 28.8),
            child: Text(
              'Explore\nthe Nature',
              style: GoogleFonts.playfairDisplay(
                  fontSize: 45.6, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 28.8, bottom: 16.8),
              height: 124.8,
              child: ListView.builder(
                  itemCount: beaches.length,
                  padding: EdgeInsets.only(left: 28.8, right: 12),
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 124.8,
                      width: 188.4,
                      margin: EdgeInsets.only(right: 16.8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(beaches[index].image),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    ));
  }
}
