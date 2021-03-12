// import 'package:explore_egypt/model/tripModel.dart';
// import 'package:explore_egypt/model/tripModel.dart';
import 'package:explore_egypt/tripComponant/addTripform/addTrain.dart';
import 'package:flutter/material.dart';
// import 'package:explore_egypt/model/hotelModel.dart';

// ignore: must_be_immutable
class HotelCard extends StatefulWidget {
  // final Trip ntrip;
  // HotelCard({Key key, @required this.ntrip}) : super(key: key);
  String programName;
   DateTime from;
  DateTime to;
  // HotelCard({Key key,  this.name}): super(key:key);

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
    this.programName,
    this.from,
    this.to
  });

  @override
  _HotelCardState createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard> {
  // String hotelName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print("hotelName${widget.hotelName}");
          print("hotelName${widget.hotelName}");
          print("adress${widget.adress}");
          print("name${widget.programName}");
          print("from${widget.from}");
          print("to${widget.to}");
          
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => addTrain(
                    hotelName: widget.hotelName,
                    roomPrice:widget.roomPrice,
                    adress: widget.adress,
                    programName:widget.programName,
                    from:widget.from,
                    to:widget.to,
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
                          child:
                              // Image.network(widget.img),
                              Icon(
                            Icons.home_work_outlined,
                            size: 70,
                            color: Colors.white,
                          ),
                          flex: 4,
                        ),
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
                                          "Room Starts from",
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
