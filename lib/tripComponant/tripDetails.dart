import 'package:explore_egypt/localization/localization_constants.dart';
import 'package:explore_egypt/services/tripSer.dart';
import 'package:explore_egypt/tripComponant/editTripForm/editTrip.dart';
import 'package:explore_egypt/tripComponant/showTrip.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// ignore: must_be_immutable
class TripDetails extends StatefulWidget {
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

  TripDetails({
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
  _TripDetailsState createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  int id;
  String programName;
  String from;
  String to;
  String toCity;
  String hotelName;
  String roomPrice;
  String adress;
  String trainNumber;
  String ticketPrice;
  String destination;
  String city;

  
  delete(id) async {
    print(" delete1$id");
    await TripService().delete(id);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(
          getTranslated(context, 'trip_details'),
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
                    //Edit and delete botton
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                       
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.edit,color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    print("edit${widget.id}");
                                    print("city${widget.city}");


                                    {
                                      id = widget.id;
                                      programName = widget.programName;
                                      from = widget.fromDate;
                                      to = widget.toDate;
                                      hotelName = widget.hotelName;
                                      roomPrice = widget.roomPrice;
                                      adress = widget.adress;
                                      destination = widget.destination;
                                      trainNumber = widget.trainNumber;
                                      ticketPrice = widget.ticketPrice;
                                      city=widget.city;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => EditTrip(
                                                    userId: widget.userId,
                                                    programName:
                                                        widget.programName,
                                                    fromDate: widget.fromDate,
                                                    toDate: widget.toDate,
                                                    cityId: widget.cityId,
                                                    fromCityId:
                                                        widget.fromCityId,
                                                    toCityId: widget.toCityId,
                                                    id: widget.id,
                                                    hotelName: widget.hotelName,
                                                    roomPrice: widget.roomPrice,
                                                    adress: widget.adress,
                                                    contactInfo:
                                                        widget.contactInfo,
                                                    trainNumber:
                                                        widget.trainNumber,
                                                    destination:
                                                        widget.destination,
                                                    ticketPrice:
                                                        widget.ticketPrice,
                                                    departureTime:
                                                        widget.departureTime,
                                                    arrivalTime:
                                                        widget.arrivalTime,
                                                    details: widget.details,
                                                    city:widget.city,
                                                  )));
                                    }
                                  }),
                              IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red.shade600,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    print("object1${widget.id}");
                                    conifrmDelete(widget.id);
                                    print("object${widget.id}");
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                     // program name
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                          child: Text(
                            widget.programName,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          ),
                        ),

                    // msg
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        getTranslated(context, 'all_set'),
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
              decoration: BoxDecoration(color: Colors.cyan.shade50),
              child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //travel details
                      Row(
                        children: [
                          Expanded(
                              // depatrutre city
                            child: Text(
                              widget.city,
                              style: TextStyle(fontSize: 20),
                            ),
                            flex: 4,
                          ),
                           // arrow icon
                          Expanded(
                            child: Icon(
                              Icons.arrow_forward,
                              size: 30,
                            ),
                            flex: 5,
                          ),
                           Expanded(
                              // depatrutre city
                            child: Text(
                              widget.destination,
                              style: TextStyle(fontSize: 20),
                            ),
                            flex: 4,
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          //departure date
                          Expanded(
                            child: Text(
                              widget.fromDate.toString().substring(0, 10)
                              // "${DateFormat("dd/MM/yyyy").format( widget.from)}"
                              ,
                              style: TextStyle(fontSize: 20),
                            ),
                            flex: 4,
                          ),
                          // arrow icon
                          Expanded(
                            child: Icon(
                              Icons.arrow_forward,
                              size: 30,
                            ),
                            flex: 5,
                          ),
                          // arrival date
                          Expanded(
                            child: Text(
                                widget.toDate.toString().substring(0, 10),
                                style: TextStyle(fontSize: 20)),
                            flex: 4,
                          )
                        ],
                      )
                    ],
                  )),
            ),
            //hotel details
            Flexible(
              child: Container(
                height: 150,
                decoration: BoxDecoration(color: Colors.cyan.shade50),
                child: Center(
                  child: Row(
                    children: [
                      //hotel icon
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
                      //hotel name
                      Expanded(
                          flex: 8,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.hotelName,
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("EGP${widget.roomPrice}",
                                    style: TextStyle(
                                      fontSize: 18,
                                    )),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 15,
                                    ),
                                    Flexible(
                                      child: Text(widget.adress,
                                          style: TextStyle(
                                            fontSize: 13,
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            // train details
            Container(
              height: 150,
              decoration: BoxDecoration(color: Colors.cyan.shade50),
              child: Center(
                child: Row(
                  children: [
                    // train icon
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
                    // train number
                    Expanded(
                        flex: 8,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.trainNumber,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: 12,
                              ),
                              Text(widget.ticketPrice,
                                  style: TextStyle(
                                    fontSize: 15,
                                  )),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 15,
                                  ),
                                  Flexible(
                                    child: Text(widget.details,
                                        style: TextStyle(
                                          fontSize: 18,
                                        )),
                                  ),
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

//// delete modal
  conifrmDelete(id) {
    print("sonfitrm$id");
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text(getTranslated(context, 'want_to_delete')),
              actions: [
                MaterialButton(
                  onPressed: () {
                    delete(id);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ShowMyTrips()));
                  },
                  child: Text(getTranslated(context, 'yes')),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(getTranslated(context, 'no')),
                )
              ],
            ));
  }
}
