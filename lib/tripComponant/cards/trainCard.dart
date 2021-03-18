import 'package:explore_egypt/tripComponant/addTripform/saveTrip.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TrainCard extends StatefulWidget {
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

  TrainCard(
      { this.userId,
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
    this.city});

  @override
  _TrainCardState createState() => _TrainCardState();
}

class _TrainCardState extends State<TrainCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print("hotelName${widget.hotelName}");
          print("hotelName${widget.roomPrice}");
          print("adress${widget.adress}");
          print("name${widget.programName}");
          print("from${widget.fromDate}");
          print("to${widget.toDate}");
          print("destination${widget.destination}");
          print("fromCityId${widget.fromCityId}");
          print("toCityId${widget.toCityId}");


          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SaveTrip(
                      userId: widget.userId,
                        programName: widget.programName,
                        fromDate: widget.fromDate,
                        toDate: widget.toDate,
                        cityId: widget.cityId,
                        fromCityId: widget.fromCityId,
                        toCityId: widget.toCityId,
                        id: widget.id,
                        hotelName: widget.hotelName,
                        roomPrice: widget.roomPrice,
                        adress: widget.adress,
                        city:widget.city,
                        contactInfo: widget.contactInfo,
                        trainNumber: widget.trainNumber,
                        destination: widget.destination,
                        ticketPrice: widget.ticketPrice,
                        departureTime: widget.departureTime,
                        arrivalTime: widget.arrivalTime,
                        details: widget.details,)));
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
                    child: Column(
                      children: [
                        // Train no. and icon
                        Row(
                          children: [
                            // Train  icon
                            Padding(
                              padding: EdgeInsets.all(18),
                              child: Icon(
                                Icons.train,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            // Train no.
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                widget.trainNumber,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25),
                              ),
                            ),
                          ],
                        ),
                        // Travel details
                        Row(
                          children: <Widget>[
                            // departure details
                            Expanded(
                              flex: 4,
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.departure_board,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    widget.city,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  Text(
                                    widget.departureTime,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            // arrows
                            Expanded(
                              flex: 4,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.arrow_forward,
                                        size: 30,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.arrow_back,
                                        size: 30,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // arrival details
                            Expanded(
                              flex: 4,
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.departure_board,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    widget.destination,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  Text(
                                    widget.arrivalTime,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ]))));
  }
}
