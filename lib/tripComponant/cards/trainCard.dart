// import 'package:explore_egypt/model/trainModal.dart';
import 'package:explore_egypt/tripComponant/addTripform/saveTrip.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TrainCard extends StatefulWidget {
  String programName;
  // DateTime from;
  // DateTime to;
   String from;
    String to;
  String hotelName;
  String roomPrice;
  String adress;

  String trainNumber;
  // City city;
  String city;

  dynamic cityId;
  String ticketPrice;
  // City destination;
  String destination;
  String destinationId;
  String departureTime;
  String arrivalTime;
  // Details details;
  int id;

  TrainCard(
      {this.trainNumber,
      this.city,
      this.cityId,
      this.ticketPrice,
      this.destination,
      this.destinationId,
      this.departureTime,
      this.arrivalTime,
      // this.details,
      this.id,
      this.hotelName,
      this.roomPrice,
      this.adress,
      this.programName,
      this.from,
      this.to});

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
          print("from${widget.from}");
          print("to${widget.to}");
          
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SaveTrip(
                    hotelName: widget.hotelName,
                    roomPrice:widget.roomPrice,
                    adress: widget.adress,
                    programName:widget.programName,
                    from:widget.from,
                    to:widget.to,
                    destination:widget.destination,
                    ticketPrice:widget.ticketPrice,
                    trainNumber:widget.trainNumber
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
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(18),
                              child: Icon(
                                Icons.train,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
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
                        Row(
                          children: <Widget>[
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
