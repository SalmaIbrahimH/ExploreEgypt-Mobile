import 'package:explore_egypt/localization/localization_constants.dart';
import 'package:explore_egypt/tripComponant/editTripForm/editHotel.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditTrip extends StatefulWidget {
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

  EditTrip({
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
  }) : super(key: key);
  @override
  _EditTripState createState() => _EditTripState();
}

class _EditTripState extends State<EditTrip> {
  int userId;
  // String programName;
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

  var formKey = GlobalKey<FormState>();
  var programName = new TextEditingController();

  void startDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.parse(widget.fromDate),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    ).then((value) => {
          if (value == null) {},
          setState(() {
            fromDate = value.toString();
          })
        });
  }

  void endDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.parse(widget.toDate),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    ).then((value) => {
          if (value == null) {},
          setState(() {
            toDate = value.toString();
          })
        });
  }

  void initState() {
    super.initState();
    setState(() {
      programName.text = widget.programName;
      fromDate = widget.fromDate;
      toDate = widget.toDate;
    });
    print("to${widget.toDate}");
    print(widget.programName);
    print(widget.fromDate);
    print(widget.details);
    print(widget.adress);
    print(widget.hotelName);
    print(widget.roomPrice);
    print(widget.trainNumber);
    print(widget.ticketPrice);
    print(widget.destination);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(getTranslated(context, 'edit_trip')),
        ),
        body: ListView(
          children: <Widget>[
            // welcome
            Container(
                height: 150,
                color: Colors.cyan,
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          getTranslated(context, 'trip_program_edit'),
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Center(
                          child: Text(
                        getTranslated(context, 'change_later'),
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                    ],
                  ),
                )),
            //start form
            Container(
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 0, left: 0, right: 0, bottom: 20),
                              child: Text(
                                getTranslated(context, 'trip_program_name'),
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: programName,
                              decoration: InputDecoration(
                                hintText:
                                    getTranslated(context, 'edit_program_name'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                            ),
                            Center(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(20),
                                    // ignore: deprecated_member_use
                                    child: RaisedButton(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Text(
                                        getTranslated(context, 'start_date'),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 24),
                                      ),
                                      color: Colors.cyan,
                                      onPressed: startDate,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(20),
                                    // ignore: deprecated_member_use
                                    child: RaisedButton(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Text(
                                        getTranslated(context, 'end_date'),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 24),
                                      ),
                                      color: Colors.cyan,
                                      onPressed: endDate,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(15),
              child: Center(
                child: MaterialButton(
                    color: Colors.green,
                    child: Text(
                      getTranslated(context, 'continue'),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      // print("from $from");
                      // print("from $to");
                      // print(programName.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditHotel(
                                    id: id,
                                    programName: programName.text,
                                    fromDate: fromDate,
                                    toDate: toDate,
                                    cityId: widget.cityId.toString(),
                                    hotelName: widget.hotelName,
                                    roomPrice: widget.roomPrice,
                                    adress: widget.adress,
                                    contactInfo: widget.contactInfo,
                                    trainNumber: widget.trainNumber,
                                    ticketPrice: widget.ticketPrice,
                                    arrivalTime: widget.arrivalTime,
                                    departureTime: widget.departureTime,
                                    destination: widget.destination,
                                    fromCityId: widget.cityId,
                                    // toCityId:widget.destinationId,
                                    details: widget.details,
                                  )));
                    }),
              ),
            )
          ],
        ));
  }
}
