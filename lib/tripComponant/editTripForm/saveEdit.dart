import 'package:explore_egypt/models/tripModel.dart';
import 'package:explore_egypt/services/tripSer.dart';
// import 'package:explore_egypt/services/tripSer.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SaveEdit extends StatefulWidget {
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


  SaveEdit({
    Key key,
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
  }) : super(key: key);
  @override
  _SaveEditState createState() => _SaveEditState();
}

class _SaveEditState extends State<SaveEdit> {
  List<Trip> program;
  editTOJson(id) async {
    program = await TripService().edit(
        id,
        widget.userId,
        widget.programName,
        widget.fromDate,
        widget.toDate,
        widget.cityId,
        widget.fromCityId,
        widget.toCityId,
        widget.hotelName,
        widget.roomPrice,
        widget.adress,
        widget.contactInfo,
        widget.trainNumber,
        widget.destination,
        widget.ticketPrice,
        widget.departureTime,
        widget.arrivalTime,
        widget.details,
        widget.city);
    print(program);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                  color: Colors.green,
                  child: Text(
                    "Edit trip",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    print("id${widget.id}");
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
                    editTOJson(widget.id);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            child: dialogContant(context),
                          );
                        });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

//////Custom alert dialog

dialogContant(BuildContext context) {
  return Stack(
    children: <Widget>[
      Container(
          padding: EdgeInsets.only(top: 150, bottom: 16, left: 16, right: 16),
          margin: EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 10))
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Your trip is Edited succssfully",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: MaterialButton(
                    color: Colors.green,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Go to main page",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                  ),
                ),
              )
            ],
          )),
      Positioned(
        top: 0,
        left: 16,
        right: 16,
        child: CircleAvatar(
          backgroundColor: Colors.green,
          radius: 80,
          backgroundImage: AssetImage("assets/thank.gif"),
        ),
      )
    ],
  );
}
