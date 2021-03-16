import 'package:explore_egypt/localization/localization_constants.dart';
import 'package:explore_egypt/models/cityModal.dart';
import 'package:explore_egypt/models/hotelModel.dart';
import 'package:explore_egypt/services/tripSer.dart';
import 'package:explore_egypt/tripComponant/editTripForm/editHotelCard.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditHotel extends StatefulWidget {
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

  EditHotel(
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
  _EditHotelState createState() => _EditHotelState();
}

class _EditHotelState extends State<EditHotel> {
  String toCity;
  String hotelName;
  String roomPrice;
  int id;
  String from;
  String to;

  String adress;
  String trainNumber;
  String ticketPrice;
  String destination;
  List<Cities> cityList = [];
  List<Hotel> hotelList = [];
  String cityvalue;
  String cityname;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setState(() {
      // cityvalue = widget.toCity;
    });
    getCityFromJson();

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
          title: Text(getTranslated(context, 'select_hotel')),
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
                                getTranslated(context, 'edit_city_and_hotel'),
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
                              getTranslated(context, 'change_later'),
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
                        getTranslated(context, 'select_city'),
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
                                    getTranslated(context, 'no_hotels'),
                                    style: TextStyle(fontSize: 20),
                                  );
                                }
                                if (hotelList.length > 0) {
                                  return ListView.builder(
                                    itemCount: hotelList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return EditHotelCard(
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
                                          child: Text(getTranslated(
                                              context, 'loading_trips')))
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
