import 'dart:convert';
import 'package:explore_egypt/localization/localization_constants.dart';
import 'package:explore_egypt/screens/home.dart';
import 'package:explore_egypt/tripComponant/addTripform/addTrip.dart';
import 'package:explore_egypt/tripComponant/showTrip.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyTrip extends StatefulWidget {
  @override
  _MyTripState createState() => _MyTripState();
}

class _MyTripState extends State<MyTrip> {
  SharedPreferences sharedPreferences;
  String userID;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    userID = utf8.decode(base64.decode(token));
    print(userID);
    print("token show trip");
    print(utf8.decode(base64.decode(token)));
    print(token);
    if (token == null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => Home()),
          (Route<dynamic> route) => false);
      final snackBar = SnackBar(content: Text('you should to be logged'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("My Trips"),
        // ),
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
