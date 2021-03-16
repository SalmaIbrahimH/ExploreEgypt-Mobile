import 'dart:convert';
import 'package:explore_egypt/model/tripModel.dart';
import 'package:explore_egypt/service/tripSer.dart';
import 'package:explore_egypt/tripComponant/cards/tripCard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Progress.dart';
import '../home.dart';

class ShowMyTrips extends StatefulWidget {
  @override
  _ShowMyTripsState createState() => _ShowMyTripsState();
}

class _ShowMyTripsState extends State<ShowMyTrips> {
  String userID;
  List<Trip> tripList = [];
  bool isApiCallProcess = false;
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    isApiCallProcess = true;
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
    }
    final snackBar = SnackBar(content: Text('you should to be logged'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  getTripsFromJson() async {
    tripList = await TripService().getTrips(userID);
    isApiCallProcess = false;
    print("data");
    print(tripList);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Progress(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("My Trips"),
        ),
        body: FutureBuilder(
            future: getTripsFromJson(),
            builder: (BuildContext context, snapshot) {
              if (tripList.length > 0) {
                return ListView.builder(
                  itemCount: tripList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TripCard(
                      programName: tripList[index].programName,
                      from: tripList[index].from,
                      to: tripList[index].to,
                      hotelName: tripList[index].selHotel.hotelName,
                      destenation: tripList[index].selTrain.destination,
                    );
                  },
                );
              } else {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(10), child: Text("No trips"))
                  ],
                ));
              }
            }));
  }
}
