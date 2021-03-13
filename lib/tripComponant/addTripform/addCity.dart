import 'package:explore_egypt/models/cityModal.dart';
import 'package:explore_egypt/models/hotelModel.dart';
import 'package:explore_egypt/services/tripSer.dart';
// import 'package:explore_egypt/tripComponant/addTripform/AddTrain.dart';
import 'package:explore_egypt/tripComponant/cards/hotelCard.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class City extends StatefulWidget {
  String programName;
  // DateTime from;
  // DateTime to;
  String from;
  String to;
  City({Key key, this.programName, this.from, this.to}) : super(key: key);

  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  List<Cities> cityList = [];
  List<Hotel> hotelList = [];
  String cityvalue;
  String cityname;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getCityFromJson();
  }

  getCityFromJson() async {
    cityList = await TripService().getCties();
    setState(() {});
  }

  getHotelByIdFromJson() async {
    hotelList = await TripService().getHotelById(cityvalue);

    setState(() {
      print("hotelLenght ${hotelList.length}");
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Select Hotel"),
        ),
        body: Container(
          child: Form(
            child: Center(
              child: Column(
                children: [
                  // intro container
                  Container(
                      height: 150,
                      color: Colors.cyan,
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                "Choose the city you will go to show the hotel",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Center(
                                child: Text(
                              "you can change these details later",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )),
                          ],
                        ),
                      )),

                  // city dropdown
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: DropdownButton(
                      value: cityvalue,
                      items: cityList.map((value) {
                        return DropdownMenuItem(
                          child: Text(
                            value.name,
                            style: TextStyle(fontSize: 25),
                          ),
                          value: value.id.toString(),
                        );
                      }).toList(),
                      onChanged: (_value) => {
                        print(_value),
                        setState(() {
                          cityvalue = _value;
                          getHotelByIdFromJson();
                        })
                      },
                      hint: Text(
                        "Select city",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),

                  // Hotel card
                  cityvalue != null
                      ? Expanded(
                          child: Container(
                            child: FutureBuilder(
                              builder: (context, snapshot) {
                                if (hotelList.length == 0) {
                                  return Text(
                                    "No Hotels Found",
                                    style: TextStyle(fontSize: 20),
                                  );
                                }
                                if (hotelList.length > 0) {
                                  return ListView.builder(
                                    itemCount: hotelList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return HotelCard(
                                        from: widget.from,
                                        to: widget.to,
                                        programName: widget.programName,
                                        hotelName: hotelList[index].hotelName,
                                        roomPrice: hotelList[index].roomPrice,
                                        contactInfo:
                                            hotelList[index].contactInfo,
                                        adress: hotelList[index].adress,
                                      );
                                    },
                                  );
                                } else {
                                  return Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                        child: CircularProgressIndicator(),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Text("Loading trips"))
                                    ],
                                  ));
                                }
                              },
                            ),
                          ),
                        )
                      : Text(""),
                ],
              ),
            ),
          ),
        ));
  }
}
