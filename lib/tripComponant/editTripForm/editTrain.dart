import 'package:explore_egypt/models/cityModal.dart';
import 'package:explore_egypt/models/trainModal.dart';
import 'package:explore_egypt/services/tripSer.dart';
import 'package:explore_egypt/tripComponant/editTripForm/editTrainCard.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditTrain extends StatefulWidget {
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

  EditTrain(
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
  _EditTrainState createState() => _EditTrainState();
}

class _EditTrainState extends State<EditTrain> {
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
  List<Train> trainList = [];
  String cityvalue;
  String destvalue;

  @override
  void initState() {
    super.initState();
    setState(() {
      // cityvalue=widget.toCity;
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
          title: Text("Select Train"),
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
                                  "Choose the departure city and destenation to show the train schadule",
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
                              "you can change these details later",
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
                        "Select City",
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
                        "Select destination",
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
                                    "No Trains Match your selection ",
                                    style: TextStyle(fontSize: 20),
                                  );
                                } else {
                                  return ListView.builder(
                                    itemCount: trainList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return EditTrainCard(
                                        from: widget.from,
                                        to: widget.to,
                                        programName: widget.programName,
                                        hotelName: widget.hotelName,
                                        roomPrice: widget.roomPrice,
                                        adress: widget.adress,
                                        trainNumber:
                                            trainList[index].trainNumber,
                                        ticketPrice:
                                            trainList[index].ticketPrice,
                                        arrivalTime:
                                            trainList[index].arrivalTime,
                                        departureTime:
                                            trainList[index].departureTime,
                                        city: trainList[index].city,
                                        destination:
                                            trainList[index].destination,
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
