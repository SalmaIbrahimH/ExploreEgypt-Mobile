
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TripDetails extends StatefulWidget {
  
  String programName;
  String from;
  String to;
  String toCity;
  String hotelName;
  String roomPrice;
  String adress;
  String trainNumber;
  String ticketPrice;
  String destenation;

  TripDetails({
    this.programName,
    this.from,
    this.to,
    this.toCity,
    this.hotelName,
    this.roomPrice,
    this.adress,
    this.trainNumber,
    this.ticketPrice,
    this.destenation
  });
  @override
  
  _TripDetailsState createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.amberAccent,
          title: Center(
            child: Text(
              "Trip Details",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          )),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 150,
              color: Colors.cyan,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.programName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Your Trip Program is all set! ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(24),
                  color: Colors.cyan.shade50),
              child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Cairo",
                              style: TextStyle(fontSize: 30),
                            ),
                            flex: 4,
                          ),
                          Expanded(
                            child: Icon(
                              Icons.arrow_forward,
                              size: 30,
                            ),
                            flex: 4,
                          ),
                          Expanded(
                            child:
                                Text(widget.destenation, style: TextStyle(fontSize: 20)),
                            flex: 4,
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              widget.from,
                              style: TextStyle(fontSize: 20),
                            ),
                            flex: 4,
                          ),
                          Expanded(
                            child: Icon(
                              Icons.arrow_back,
                              size: 30,
                            ),
                            flex: 5,
                          ),
                          Expanded(
                            child: Text(widget.to, style: TextStyle(fontSize: 20)),
                            flex: 4,
                          )
                        ],
                      )
                    ],
                  )),
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(24),
                  color: Colors.cyan.shade50),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.hotel,
                            size: 40,
                            color: Colors.deepOrangeAccent,
                          )),
                    ),
                    Expanded(
                        flex: 8,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.hotelName,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: 16,
                              ),
                              Text("widget.roomPrice",
                                  style: TextStyle(
                                    fontSize: 15,
                                  )),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 15,
                                  ),
                                  Text("widget.adress",
                                      style: TextStyle(
                                        fontSize: 18,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(24),
                  color: Colors.cyan.shade50),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.train,
                            size: 40,
                            color: Colors.deepOrangeAccent,
                          )),
                    ),
                    Expanded(
                        flex: 8,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("widget.trainNumber",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: 16,
                              ),
                              Text("widget.ticketPrice",
                                  style: TextStyle(
                                    fontSize: 15,
                                  )),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 15,
                                  ),
                                  Text("Adress",
                                      style: TextStyle(
                                        fontSize: 18,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
