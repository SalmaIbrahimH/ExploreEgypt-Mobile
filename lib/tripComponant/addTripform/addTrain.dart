import 'package:explore_egypt/localization/localization_constants.dart';
import 'package:explore_egypt/models/cityModal.dart';
import 'package:explore_egypt/models/trainModal.dart';
import 'package:explore_egypt/services/tripSer.dart';
import 'package:explore_egypt/tripComponant/cards/trainCard.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddTrain extends StatefulWidget {
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
  String city;

  AddTrain({
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
    this.city,
  }) : super(key: key);

  @override
  _AddTrainState createState() => _AddTrainState();
}

class _AddTrainState extends State<AddTrain> {
  List<Cities> cityList = [];
  List<Train> trainList = [];
  String cityvalue;
  String destvalue;

  @override
  void initState() {
    super.initState();
    getCityFromJson();
  }

  getCityFromJson() async {
    cityList = await TripService().getCties();
    setState(() {});
  }

  getTrainBycityIdFromJson() async {
    trainList = await TripService().getTrainBycityId(cityvalue);

    setState(() {});
  }

  getTrainByIdFromJson() async {
    trainList = await TripService().getTrainById(destvalue, cityvalue);

    setState(() {
      print("trainLenght ${trainList.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(getTranslated(context, 'select_train')),
        ),
        body: Container(
          child: Form(
            child: Center(
              child: Column(
                children: [
                  Container(
                      height: 150,
                      color: Colors.cyan,
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Center(
                              child: Flexible(
                                child: Text(
                                  getTranslated(
                                      context, 'choose_start_and_dest'),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
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
                          getTrainBycityIdFromJson();
                        })
                      },
                      hint: Text(
                        getTranslated(context, 'select_city'),
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: DropdownButton<String>(
                      value: destvalue,
                      items: cityList.map((value) {
                        return DropdownMenuItem(
                          child: Text(value.name),
                          value: value.id.toString(),
                        );
                      }).toList(),
                      onChanged: (_value) => {
                        print(_value),
                        setState(() {
                          destvalue = _value;
                          getTrainByIdFromJson();
                        })
                      },
                      hint: Text(
                        getTranslated(context, 'select_dest'),
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  (destvalue != null || cityvalue != null)
                      ? Expanded(
                          child: Container(
                            child: FutureBuilder(
                              builder: (context, snapshot) {
                                if (trainList.length == 0) {
                                  return Text(
                                    getTranslated(context, 'no_trains'),
                                    style: TextStyle(fontSize: 20),
                                  );
                                } else {
                                  return ListView.builder(
                                    itemCount: trainList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return TrainCard(
                                        userId: widget.userId,
                                        programName: widget.programName,
                                        fromDate: widget.fromDate,
                                        toDate: widget.toDate,
                                        cityId: widget.cityId.toString(),
                                        hotelName: widget.hotelName,
                                        roomPrice: widget.roomPrice,
                                        adress: widget.adress,
                                        // city:widget.city,
                                        contactInfo: widget.contactInfo,
                                        trainNumber:
                                            trainList[index].trainNumber,
                                        ticketPrice:
                                            trainList[index].ticketPrice,
                                        arrivalTime:
                                            trainList[index].arrivalTime,
                                        departureTime:
                                            trainList[index].departureTime,
                                        destination:
                                            trainList[index].destination,
                                        fromCityId: trainList[index].cityId.toString(),
                                        toCityId: trainList[index].destinationId.toString(),
                                        details: trainList[index].details,
                                        city:trainList[index].city
                                      );
                                    },
                                  );
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
