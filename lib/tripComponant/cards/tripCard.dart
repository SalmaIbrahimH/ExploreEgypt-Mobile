import 'package:explore_egypt/tripComponant/tripDetails.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TripCard extends StatefulWidget {
  String programName;
  String from;
  String to;
  String hotelName;
  String roomPrice;
  String adress;
  String trainNumber;
  String ticketPrice;
  String destenation;
  String selHotel;
  String selTrain;

  TripCard({
    this.programName,
    this.from,
    this.to,
    this.hotelName,
    this.roomPrice,
    this.adress,
    this.trainNumber,
    this.ticketPrice,
    this.destenation,
    this.selHotel,
    this.selTrain,
  });

  @override
  _TripCardState createState() => _TripCardState();
}

class _TripCardState extends State<TripCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TripDetails(
                        programName: widget.programName,
                        destenation: widget.destenation,
                        hotelName: widget.hotelName,
                        roomPrice: widget.roomPrice,
                        from: widget.from,
                        to: widget.to,
                        ticketPrice: widget.ticketPrice,
                        trainNumber: widget.trainNumber,
                        adress: widget.adress,
                      )));
        },
        child: Card(
            child: Padding(
                padding: EdgeInsets.all(8),
                child: Stack(children: <Widget>[
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                            colors: [Colors.lightBlue.shade200, Colors.blue],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 6,
                            offset: Offset(0, 6),
                          )
                        ]),
                  ),
                  Positioned.fill(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Icon(
                            Icons.card_travel_rounded,
                            size: 60,
                            color: Colors.white,
                          ),
                          flex: 4,
                        ),
                        Expanded(
                          flex: 8,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: <Widget>[
                                  Text(
                                    "widget.programName",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "sans-serif",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Flexible(
                                    child: Text(
                                      "widget.hotelName",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "sans-serif",
                                          fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "widget.destenation",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "sans-serif",
                                          fontSize: 20),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ]))));
  }
}
