import 'package:explore_egypt/TripComponant/addTripform/addCity.dart';
import 'package:flutter/material.dart';

class NewTrip extends StatefulWidget {
  @override
  _NewTripState createState() => _NewTripState();
}

class _NewTripState extends State<NewTrip> {
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
  String city;
  var formKey = GlobalKey<FormState>();
  var programName = new TextEditingController();

  void startDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
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
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    ).then((value) => {
          if (value == null) {},
          setState(() {
            toDate = value.toString();
          })
        });
  }

  
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("New Trip"),
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
                          "Trip Program Setup",
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
                        "you can change these details later",
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
                                "Trip program name",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: programName,
                              decoration: InputDecoration(
                                hintText: "Enter you trip name",
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
                                        "Start Date",
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
                                        "End Date",
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
                child:
                    MaterialButton(
                        color: Colors.green,
                        child: Text(
                          "Continue",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          // print("from $from");
                          // print("from $to");
                          // print(programName.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => City(
                                        programName: programName.text,
                                        fromDate: fromDate,
                                        toDate: toDate,
                                      )));
                        }),
              ),
            )
          ],
        ));
  }
}
