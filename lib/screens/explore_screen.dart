import 'package:flutter/material.dart';
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
              indicatorWeight: 2.2,
              labelColor: Colors.black,
              labelStyle: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
              tabs: <Widget>[
                Tab(
                  text: 'Facts',
                ),
                Tab(
                  text: 'Culture',
                ),
                Tab(
                  text: 'History',
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
