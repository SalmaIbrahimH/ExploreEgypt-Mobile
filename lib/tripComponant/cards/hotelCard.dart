import 'package:flutter/material.dart';
import 'package:explore_egypt/model/hotelModel.dart';

// ignore: must_be_immutable
class HotelCard extends StatefulWidget {
  int id;
    String hotelName;
    // City city;
    String roomPrice;
    String contactInfo;
    String adress;
    String cityId;
    String img;
    
  HotelCard({
        this.id,
        this.hotelName,
        // this.city,
        this.roomPrice,
        this.contactInfo,
        this.adress,
        this.cityId,
        this.img,
    });

    
  @override
  _HotelCardState createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Card(
            child: Padding(
                padding: EdgeInsets.all(8),
                child: Stack(children: <Widget>[
                  Container(
                    height: 130,
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
                            Icons.home_work_outlined,
                            size: 70,
                            color: Colors.white,
                          ),
                          flex: 4,
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: <Widget>[
                                  Text(
                                    widget.hotelName,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "sans-serif",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
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
                                height: 16,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    widget.adress,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "sans-serif",
                                        fontSize: 12),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 4,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "Room Starts from",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "sans-serif",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Flexible(
                                        child: Text(
                                          widget.roomPrice,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "sans-serif",
                                              fontSize: 20),
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
