import 'package:explore_egypt/TripComponant/addTripform/addCity.dart';
// import 'package:explore_egypt/model/tripModel.dart';
// import 'package:explore_egypt/service/tripSer.dart';
import 'package:flutter/material.dart';


class NewTrip extends StatefulWidget {
  // final Trip ntrip;
  // NewTrip({Key key,  this.ntrip}) : super(key: key);
  

  @override
  _NewTripState createState() => _NewTripState();
}

class _NewTripState extends State<NewTrip> {
  String programNameq;
  DateTime from;
  DateTime to;
  void startDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    ).then((value) => {
          if (value == null) {},
          setState(() {
            from = value;
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
            to = value;
          })
        });
  }

  // save() async {
  //   programNameq = (await TripService().save(programName.text)) as String;
  //   setState(() {});
  // }

  var formKey = GlobalKey<FormState>();
  var programName = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //  final nwTrip = new Trip(null,null,null, null,null,null,null, null,null,null);
    return Scaffold(
        appBar: AppBar(
          title: Text("New Trip"),
        ),
        body: Column(
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
                            Text("Trip program name"),
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
                                            color: Colors.cyan, fontSize: 24),
                                      ),
                                      color: Colors.deepPurple,
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
                                            color: Colors.cyan, fontSize: 24),
                                      ),
                                      color: Colors.deepPurple,
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

            //  Center(child: Text(" your start date is ${DateFormat("dd/MM/yyyy").format(from)}"),),
            //  Center(child: Text(" your End date is ${DateFormat("dd/MM/yyyy").format(to)}"),),

            Padding(
              padding: EdgeInsets.all(15),
              child: Center(
                child:
                    // ignore: deprecated_member_use
                    RaisedButton(
                        color: Colors.green,
                        child: Text(
                          "Continue",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          // print("from $from");
                          // print("from $to");
                          // print(programName.text);
                          // widget.ntrip.from = from;
                          // widget.ntrip.to = to;
                          // widget.ntrip.programName = programName.text;
                          // save();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      City(
                                      programName:programName.text,
                                      from:from,
                                      to:to,)));
                        }),
              ),
            )
          ],
        ));
  }
}
