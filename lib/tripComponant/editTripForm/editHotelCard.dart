import 'package:explore_egypt/localization/localization_constants.dart';
import 'package:explore_egypt/tripComponant/editTripForm/editTrainCard.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditHotelCard extends StatefulWidget {
  String programName;
  String from;
  String to;
  int id;
  String hotelName;
  String roomPrice;
  String contactInfo;
  String adress;
  String cityId;
  String img;

  EditHotelCard({
    this.id,
    this.hotelName,
    this.roomPrice,
    this.contactInfo,
    this.adress,
    this.cityId,
    this.img,
    this.programName,
    this.from,
    this.to,
    // this.destination,
    // this.ticketPrice,
    // this.trainNumber
  });

  @override
  _EditHotelCardState createState() => _EditHotelCardState();
}

class _EditHotelCardState extends State<EditHotelCard> {
  int id;
  String from;
  String to;
  String toCity;
  String hotelName;
  String roomPrice;
  String adress;
  // String trainNumber;
  // String ticketPrice;
  // String destination;

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
                  builder: (context) => EditTrainCard(
                        hotelName: widget.hotelName,
                        roomPrice: widget.roomPrice,
                        adress: widget.adress,
                        programName: widget.programName,
                        from: widget.from,
                        to: widget.to,
                        // destination: widget.destination,
                        // trainNumber: widget.trainNumber,
                        // ticketPrice: widget.ticketPrice,
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
                        //hotel img
                        Expanded(
                          child:
                              // Image.network(widget.img),
                              Icon(
                            Icons.home_work_outlined,
                            size: 70,
                            color: Colors.white,
                          ),
                          flex: 4,
                        ),
                        // hotel name
                        Expanded(
                          flex: 6,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: <Widget>[
                                  Flexible(
                                    child: Text(
                                      widget.hotelName,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "sans-serif",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 13,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.phone,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  Flexible(
                                    child: Text(
                                      widget.contactInfo,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "sans-serif",
                                          fontSize: 15),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  Flexible(
                                    child: Text(
                                      widget.adress,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "sans-serif",
                                          fontSize: 12),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        // Room price
                        Expanded(
                            flex: 3,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Flexible(
                                        child: Text(
                                          getTranslated(
                                              context, 'room_start_from'),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "sans-serif",
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Flexible(
                                        child: Row(
                                          children: [
                                            Icon(Icons.attach_money_outlined),
                                            Text(
                                              widget.roomPrice,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "sans-serif",
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  )
                ]))));
  }
}
