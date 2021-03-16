import 'package:explore_egypt/localization/localization_constants.dart';
import 'package:explore_egypt/widgets/custom_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'culture_screen.dart';
import 'facts_screen.dart';
import 'history_screen.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        child: Column(
          children: <Widget>[
            TabBar(
              labelStyle: GoogleFonts.lato(fontSize: 20),
              labelColor: Colors.grey[700],
              unselectedLabelColor: Colors.grey[400],
              indicatorPadding: EdgeInsets.only(
                left: 14.4,
                right: 14.4,
                top: 20,
              ),
              isScrollable: true,
              indicatorColor: Colors.grey[800],
              indicator: RoundedRectangleTabIndicator(
                color: Color(0xFF000000),
                weight: 2.4,
                width: 30,
              ),
              tabs: <Widget>[
                Tab(
                  text: getTranslated(context, 'facts'),
                ),
                Tab(
                  text: getTranslated(context, 'culture'),
                ),
                Tab(
                  text: getTranslated(context, 'history'),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  FactsScreen(),
                  CultureScreen(),
                  HistoryScreen(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
