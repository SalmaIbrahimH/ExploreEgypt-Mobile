import 'package:explore_egypt/tripComponant/editTripForm/saveEdit.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditTrainCard extends StatefulWidget {
  String programName;
  String from;
  String to;
  String hotelName;
  String roomPrice;
  String adress;
  String trainNumber;
  String city;
  dynamic cityId;
  String ticketPrice;
  String destination;
  String destinationId;
  String departureTime;
  String arrivalTime;
  int id;

  EditTrainCard(
      {this.trainNumber,
      this.city,
      this.cityId,
      this.ticketPrice,
      this.destination,
      this.destinationId,
      this.departureTime,
      this.arrivalTime,
      this.id,
      this.hotelName,
      this.roomPrice,
      this.adress,
      this.programName,
      this.from,
      this.to});

  @override
  _EditTrainCardState createState() => _EditTrainCardState();
}

class _EditTrainCardState extends State<EditTrainCard> {
  String toCity;
  String hotelName;
  String roomPrice;
  int id;
  String from;
  String to;
  String adress;
  String trainNumber;
  String ticketPrice;
  String destination;
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
          print("destination${widget.destination}");

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SaveEdit(
                      hotelName: widget.hotelName,
                      roomPrice: widget.roomPrice,
                      adress: widget.adress,
                      programName: widget.programName,
                      from: widget.from,
                      to: widget.to,
                      destination: widget.destination,
                      ticketPrice: widget.ticketPrice,
                      trainNumber: widget.trainNumber)));
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
