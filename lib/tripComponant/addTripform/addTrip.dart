
import 'package:explore_egypt/TripComponant/addTripform/addCity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTrip extends StatefulWidget {
  @override
  _NewTripState createState() => _NewTripState();
}

class _NewTripState extends State<NewTrip> {
  DateTime selectedStart;
  DateTime selectedEnd;
  void startDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    ).then((value) => {
      if(value== null){},
      setState((){
        selectedStart= value;
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
      if(value== null){},
      setState((){
        selectedEnd= value;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("New Trip"),
        ),
        body: Column(
          children: [
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
            Container(
              child: Center(
                child: Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text("Trip program name"),
                             TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter you trip name",
                            
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                        ),
                          ],),)
                      
                    ],
                  ),
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
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        "Start Date",
                        style: TextStyle(color: Colors.cyan, fontSize: 24),
                      ),
                      color: Colors.deepPurple,
                      onPressed: startDate,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        "End Date",
                        style: TextStyle(color: Colors.cyan, fontSize: 24),
                      ),
                      color: Colors.deepPurple,
                      onPressed: endDate,
                    ),
                  ),
                ],
              ),
            ),
            //  Center(child: Text(" your start date is ${DateFormat("dd/MM/yyyy").format(selectedStart)}"),),
            //  Center(child: Text(" your End date is ${DateFormat("dd/MM/yyyy").format(selectedEnd)}"),),
            
            Padding(padding: EdgeInsets.all(15),
            child: Center(child:
            // ignore: deprecated_member_use
             RaisedButton(
               color: Colors.green,
               child: Text("Continue",style: TextStyle(color: Colors.white,fontSize: 20),)
               ,onPressed: (){Navigator.push(context, 
                          MaterialPageRoute(builder: (context)=> City()));}),),)
          ],
        ));
  }
}
