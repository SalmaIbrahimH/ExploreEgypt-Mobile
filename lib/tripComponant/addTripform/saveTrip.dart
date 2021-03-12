import 'package:explore_egypt/models/tripModel.dart';
import 'package:explore_egypt/service/tripSer.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SaveTrip extends StatefulWidget {
  String programName;
  DateTime from;
  DateTime to;
  String hotelName;
  String roomPrice;
  String adress;
  String ticketPrice;
  String destination;
  String trainNumber;

  SaveTrip(
      {Key key,
      this.hotelName,
      this.adress,
      this.roomPrice,
      this.programName,
      this.from,
      this.to,
      this.destination,
      this.ticketPrice,
      this.trainNumber})
      : super(key: key);
  @override
  _SaveTripState createState() => _SaveTripState();
}

class _SaveTripState extends State<SaveTrip> {
  List<Trip> program;
  save() async {
    program = await TripService().save(
        widget.programName,
        //  widget.from, widget.to,
        widget.hotelName,
        widget.roomPrice,
        widget.adress,
        widget.destination,
        widget.trainNumber,
        widget.ticketPrice);
    print(program);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Center(
          child:
              // ignore: deprecated_member_use
              RaisedButton(
                  color: Colors.green,
                  child: Text(
                    "add trip",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    print("hotelName${widget.hotelName}");
                    print("hotelName${widget.hotelName}");
                    print("adress${widget.adress}");
                    print("name${widget.programName}");
                    print("from${widget.from}");
                    print("to${widget.to}");
                    save();
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  }),
        ),
      ),
    );
  }
}
