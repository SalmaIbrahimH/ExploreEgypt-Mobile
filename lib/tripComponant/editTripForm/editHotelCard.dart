import 'package:explore_egypt/localization/localization_constants.dart';
// import 'package:explore_egypt/tripComponant/editTripForm/editTrainCard.dart';
import 'package:explore_egypt/tripComponant/editTripForm/editTrain.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditHotelCard extends StatefulWidget {
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

  EditHotelCard(
      {this.userId,
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
  _EditHotelCardState createState() => _EditHotelCardState();
}

class _EditHotelCardState extends State<EditHotelCard> {
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


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print("to${widget.id}");
          print("to${widget.toDate}");
          print("name${widget.programName}");
          print("from${widget.fromDate}");
          print("detail${widget.details}");
          print("adress${widget.adress}");
          print("hotel${widget.hotelName}");
          print("rprice${widget.roomPrice}");
          print("trainno${widget.trainNumber}");
          print("ticketprive${widget.ticketPrice}");
          print("destenaion${widget.destination}");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditTrain(
                        userId: widget.userId,
                        programName: widget.programName,
                        fromDate: widget.fromDate,
                        toDate: widget.toDate,
                        cityId: widget.cityId,
                        hotelName: widget.hotelName,
                        roomPrice: widget.roomPrice,
                        adress: widget.adress,
                        contactInfo: widget.contactInfo,
                        fromCityId: widget.fromCityId,
                        toCityId: widget.toCityId,
                        id: widget.id,
                        trainNumber: widget.trainNumber,
                        destination: widget.destination,
                        ticketPrice: widget.ticketPrice,
                        departureTime: widget.departureTime,
                        arrivalTime: widget.arrivalTime,
                        details: widget.details,
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
