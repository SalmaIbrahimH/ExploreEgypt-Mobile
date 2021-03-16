import 'package:explore_egypt/localization/localization_constants.dart';
import 'package:explore_egypt/models/tripModel.dart';
import 'package:explore_egypt/services/tripSer.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SaveTrip extends StatefulWidget {
  String programName;
  // DateTime from;
  // DateTime to;
  String from;
  String to;
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
        widget.from,
        widget.to,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                  color: Colors.green,
                  child: Text(
                    getTranslated(context, 'add_trip'),
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
                  getTranslated(context, 'trip_saved'),
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
                      child: Text(getTranslated(context, 'go_to_main'),
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
