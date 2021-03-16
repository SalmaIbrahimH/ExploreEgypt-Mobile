import 'package:explore_egypt/TripComponant/addTripform/addCity.dart';
import 'package:explore_egypt/localization/localization_constants.dart';
import 'package:flutter/material.dart';

class NewTrip extends StatefulWidget {
  @override
  _NewTripState createState() => _NewTripState();
}

class _NewTripState extends State<NewTrip> {
  String programNameq;
  // DateTime from;
  // DateTime to;
  String from;
  String to;
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
            from = value.toString();
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
            to = value.toString();
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(getTranslated(context, 'new_trip')),
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
                          getTranslated(context, 'trip_program_setup'),
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
                                    getTranslated(context, 'enter_trip_name'),
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
                              builder: (context) => City(
                                    programName: programName.text,
                                    from: from,
                                    to: to,
                                  )));
                    }),
              ),
            )
          ],
        ));
  }
}
