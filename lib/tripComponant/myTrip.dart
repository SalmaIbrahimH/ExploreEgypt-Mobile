// ignore: avoid_web_libraries_in_flutter
// import 'dart:html';

import 'package:explore_egypt/localization/localization_constants.dart';
import 'package:explore_egypt/tripComponant/addTripform/addTrip.dart';
import 'package:explore_egypt/tripComponant/showTrip.dart';

import 'package:flutter/material.dart';

class MyTrip extends StatefulWidget {
  @override
  _MyTripState createState() => _MyTripState();
}

class _MyTripState extends State<MyTrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: MaterialButton(
                child: Text(
                  getTranslated(context, 'new_trip'),
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                color: Colors.blue,
                height: 50,
                minWidth: double.infinity,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewTrip()));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: MaterialButton(
                child: Text(
                  getTranslated(context, 'show_trip'),
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                color: Colors.blue,
                height: 50,
                minWidth: double.infinity,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShowMyTrips()));
                },
              ),
            )
          ]),
    ));
  }
}
