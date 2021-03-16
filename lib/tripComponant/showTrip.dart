import 'package:explore_egypt/models/tripModel.dart';
import 'package:explore_egypt/services/tripSer.dart';
import 'package:explore_egypt/tripComponant/cards/tripCard.dart';
import 'package:flutter/material.dart';

class ShowMyTrips extends StatefulWidget {
  @override
  _ShowMyTripsState createState() => _ShowMyTripsState();
}

class _ShowMyTripsState extends State<ShowMyTrips> {

  List<Trip> tripList = [];

  @override
  void initState() {
    super.initState();
    getTripsFromJson();
    
  }

  getTripsFromJson() async {
    tripList = await TripService().getTrips();
    setState(() {
      
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
                      id:tripList[index].id,
                      programName: tripList[index].programName,
                      fromDate: tripList[index].fromDate,
                      toDate: tripList[index].toDate.toString(),
                      hotelName: tripList[index].selHotel.hotelName,
                      roomPrice: tripList[index].selHotel.roomPrice,
                      adress: tripList[index].selHotel.adress,
                      contactInfo: tripList[index].selHotel.contactInfo,
                      destination: tripList[index].selTrain.destination,
                      trainNumber:
                          tripList[index].selTrain.trainNumber,
                      ticketPrice: tripList[index].selTrain.ticketPrice,
                      details: tripList[index].selTrain.details.toString(),

                    );
                  },
                );
              } else {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("Loading trips",style: TextStyle(fontSize: 20),),)
                  ],
                ));
              }
            }));
  }
}
