import 'package:explore_egypt/tripComponant/tripDetails.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TripCard extends StatefulWidget {
  int userId;
  String programName;
  String fromDate;
  String toDate;
  String cityId;
  String fromCityId;
  String toCityId;
  int id;
  String hotelName;
  String roomPrice;
  String adress;
  String contactInfo;
  String trainNumber;
  String destination;
  String ticketPrice;
  String departureTime;
  String arrivalTime;
  String details;
  String city;

  TripCard({
    this.userId,
    this.programName,
    this.fromDate,
    this.toDate,
    this.cityId,
    this.fromCityId,
    this.toCityId,
    this.id,
    this.hotelName,
    this.roomPrice,
    this.adress,
    this.contactInfo,
    this.trainNumber,
    this.destination,
    this.ticketPrice,
    this.departureTime,
    this.arrivalTime,
    this.details,
    this.city
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
                        userId: widget.userId,
                        programName: widget.programName,
                        fromDate: widget.fromDate.toString(),
                        toDate: widget.toDate.toString(),
                        cityId: widget.cityId,
                        fromCityId: widget.fromCityId,
                        toCityId: widget.toCityId,
                        id: widget.id,
                        hotelName: widget.hotelName,
                        roomPrice: widget.roomPrice,
                        adress: widget.adress,
                        contactInfo: widget.contactInfo,
                        trainNumber: widget.trainNumber,
                        destination: widget.destination,
                        ticketPrice: widget.ticketPrice,
                        departureTime: widget.departureTime,
                        arrivalTime: widget.arrivalTime,
                        details: widget.details,
                        city: widget.city,
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
                                    widget.programName,
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
                                      widget.hotelName,
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
                                      widget.destination,
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
