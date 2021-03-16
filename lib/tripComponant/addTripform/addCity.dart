import 'package:explore_egypt/model/cityModal.dart';
import 'package:explore_egypt/model/hotelModel.dart';
import 'package:explore_egypt/service/tripSer.dart';
import 'package:explore_egypt/tripComponant/addTripform/addTrain.dart';
import 'package:explore_egypt/tripComponant/cards/hotelCard.dart';

import 'package:flutter/material.dart';

class City extends StatefulWidget {
  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  // ignore: deprecated_member_use
  List<Cities> cityList = new List();
  // ignore: deprecated_member_use
  List<Hotel> hotelList = new List();
  String cityvalue;
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: DropdownButton(
                    value: cityvalue,
                    items: cityList.map((value) {
                      return DropdownMenuItem(
                        child: Text(value.name),
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
                // Text(cityvalue),

                cityvalue != null
                    ? Expanded(
                        child: Container(
                          //  height: 400,

                          child: FutureBuilder(
                            //  future: getHotelByIdFromJson(),
                            builder: (context, snapshot) {
                              print(snapshot.hasData);
                              //  if(snapshot.hasData){
                              if (hotelList.length == 0) {
                                return Text("no hotels in this city");
                              } else {
                                return ListView.builder(
                                  itemCount: hotelList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return HotelCard(
                                      hotelName: hotelList[index].hotelName,
                                      roomPrice: hotelList[index].roomPrice,
                                      contactInfo: hotelList[index].contactInfo,
                                      adress: hotelList[index].adress,
                                    );
                                  },
                                );
                              }
                              //  }else  {return Text("no data found");}
                            },
                          ),
                        ),
                      )
                    : Text("selct city first"),
                Padding(
                  padding: EdgeInsets.all(40),
                  child: Center(
                    child:
                        // ignore: deprecated_member_use
                        RaisedButton(
                            color: Colors.green,
                            child: Text(
                              "Continue",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Train()));
                            }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
