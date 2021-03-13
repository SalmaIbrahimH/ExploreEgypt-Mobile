import 'package:explore_egypt/tripComponant/editTripForm/editHotel.dart';
import 'package:flutter/material.dart';

class EditTrip extends StatefulWidget {
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

  EditTrip(
      {Key key,
      this.id,
      this.programName,
      this.from,
      this.to,
      this.toCity,
      this.hotelName,
      this.roomPrice,
      this.adress,
      this.trainNumber,
      this.ticketPrice,
      this.destination})
      : super(key: key);
  @override
  _EditTripState createState() => _EditTripState();
}

class _EditTripState extends State<EditTrip> {
  int id;
  String from;
  String to;
   String toCity;
  String hotelName;
  String roomPrice;
  String adress;
  String trainNumber;
  String ticketPrice;
  String destination;

  var formKey = GlobalKey<FormState>();
  var programName = new TextEditingController();

  void startDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.parse(widget.from),
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
      initialDate: DateTime.parse(widget.to),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    ).then((value) => {
          if (value == null) {},
          setState(() {
            to = value.toString();
          })
        });
  }

  void initState() {
    super.initState();
    setState(() {
      programName.text = widget.programName;
      from = widget.from;
      to = widget.to;
    });
    print(widget.id);
    print(widget.programName);
    print(widget.from);
    print(widget.to);
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
          title: Text("Edit your Trip"),
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
                          "Trip Program Edit",
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
                        "you can Edit your trip details",
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
                                hintText: "Edit you trip name",
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
                child: MaterialButton(
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
                              builder: (context) => EditHotel(
                                    programName: programName.text,
                                    from: from,
                                    to: to,
                                    hotelName: hotelName,
                                    roomPrice: roomPrice,
                                    adress: adress,
                                    destination: destination,
                                    trainNumber: trainNumber,
                                    ticketPrice: ticketPrice,
                                  )));
                    }),
              ),
            )
          ],
        ));
  }
}
