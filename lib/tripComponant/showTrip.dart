

import 'package:explore_egypt/models/tripModel.dart';
import 'package:explore_egypt/services/tripSer.dart';
import 'package:explore_egypt/tripComponant/cards/tripCard.dart';
import 'package:flutter/material.dart';

class ShowMyTrips extends StatefulWidget {
  @override
  _ShowMyTripsState createState() => _ShowMyTripsState();
}

class _ShowMyTripsState extends State<ShowMyTrips> {
  // ignore: deprecated_member_use
  List<Trip> tripList = new List();
  // ignore: deprecated_member_use
  // List<Hotel> hotelList = new List();

  @override
  void initState() {
    super.initState();
    getTripsFromJson();
  }

  getTripsFromJson() async {
    tripList = await TripService().getTrips();
    setState(() {});
  }
 

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Trips"),
        ),
         body: 
        FutureBuilder(
          future: getTripsFromJson(),
        builder:(BuildContext context, snapshot ){
        //   if(snapshot.connectionState == ConnectionState.done){
           if(tripList.length>0){
            return 
             ListView.builder(
            itemCount: tripList.length,
            itemBuilder: (BuildContext context, int index) {
            return  TripCard(
                programName: tripList[index].programName,
                 from: tripList[index].from.toString(),
                 to: tripList[index].to.toString(),
                hotelName: tripList[index].selHotel.hotelName,
                 roomPrice: tripList[index].selHotel.roomPrice,
                //  adress: tripList[index].selHotel.hotelName,
                destenation: tripList[index].selTrain.destination,
                trainNumber: tripList[index].selTrain.trainNumber.toString(),
                 ticketPrice: tripList[index].selTrain.ticketPrice,
              );
            
          },);
          }else{ return
            Center(
              child:Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Padding(padding: EdgeInsets.all(10),
                child: CircularProgressIndicator(),),
                Padding(padding: EdgeInsets.all(10),
               child: Text("Loading trips"))
              ],)
         
         
        );
  }
}));
  }}