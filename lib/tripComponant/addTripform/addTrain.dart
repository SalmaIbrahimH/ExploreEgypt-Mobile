
import 'package:explore_egypt/models/cityModal.dart';
import 'package:explore_egypt/models/trainModal.dart';
import 'package:explore_egypt/services/tripSer.dart';
import 'package:explore_egypt/tripComponant/cards/trainCard.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
// ignore: must_be_immutable
// ignore: camel_case_types
// ignore: must_be_immutable
class addTrain extends StatefulWidget {
  // final Trip ntrip;
  // addTrain({Key key, @required this.ntrip}): super(key:key);
  String programName;
  // DateTime from;
  // DateTime to;
   String from;
    String to;
  String hotelName;
  String roomPrice;
  String adress;
  addTrain({Key key,  this.hotelName,this.adress,this.roomPrice,this.programName,
  this.from,this.to}): super(key:key);
  
  @override
  _AddTrainState createState() => _AddTrainState();
}

class _AddTrainState extends State<addTrain> {
  // ignore: deprecated_member_use
  List<Cities> cityList = new List();
  // ignore: deprecated_member_use
  List<Train> trainList = new List();
  String cityvalue ;
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
    
    setState(() {
      print("trainLenght ${trainList.length}");
    });
  }

  getTrainByIdFromJson() async {
    trainList = await TripService().getTrainById(destvalue,cityvalue);
    
    setState(() {
      print("trainLenght ${trainList.length}");
    });
  }
  String staticValue="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Train"),
      ),
      body: Container(
        child: Form(
          child: Center(
          child:  Column(
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
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                    ],
                  ),
                )),
             Padding(padding: EdgeInsets.all(10),
            child: DropdownButton(
              value: cityvalue ,
              items: cityList.map((value){
                return DropdownMenuItem(
                  child: Text(value.name),
                value: value.id.toString(),);
              }).toList(),
              onChanged: (_value)=>{
                print(_value),
                setState((){
                  cityvalue=_value;
                  getTrainBycityIdFromJson() ;
                })
              },
              hint: Text("Select city",style: TextStyle(fontSize: 25),),
            ),),
            Padding(padding: EdgeInsets.all(10),
            child: DropdownButton<String>(
              
              value: destvalue ,
              items: cityList.map((value){
                return DropdownMenuItem(
                  child: Text(value.name),
                value: value.id.toString(),);
              }).toList(),
              onChanged: (_value)=>{
                print(_value),
                setState((){
                  destvalue=_value;
                  getTrainByIdFromJson() ;
                })
              
              },
              hint: Text("Select destination",style: TextStyle(fontSize: 25),),
            ),),

            (destvalue !=null|| cityvalue !=null)? Expanded(
            child: Container(
              //  height: 400,

               child: 
               FutureBuilder(
                //  future: getHotelByIdFromJson(),
                 builder:(context, snapshot){
                  //  print(snapshot.hasData);
                  //  if(snapshot.hasData){
                     if(trainList.length == 0 ){
                       return Text("no hotels in this city");
                     }else
                     {return 
                     ListView.builder(
                       itemCount: trainList.length,
                       itemBuilder: (BuildContext context,int index){
                         return
                         TrainCard(
                           from: widget.from,
                            to: widget.to,
                            programName: widget.programName,
                            hotelName: widget.hotelName,
                            roomPrice:widget.roomPrice,
                           adress: widget.adress,
                          trainNumber: trainList[index].trainNumber,
                          // ticketPrice: trainList[index].ticketPrice,
                          arrivalTime: trainList[index].arrivalTime,
                          departureTime: trainList[index].departureTime,
                          city: trainList[index].city,
                          destination: trainList[index].destination,
                          
                         );
                       } ,);}
                  //  }else  {return Text("no data found");}
                 } ,),
            ),
          ): Text("selct city first"),
            
            // TrainCard(),
            // TrainCard(),
            // Padding(padding: EdgeInsets.all(40),
            // child: Center(child:
            //  // ignore: deprecated_member_use
            //  RaisedButton(
            //      color: Colors.green,
            //      child: Text("Continue",style: TextStyle(color: Colors.white,fontSize: 20),)
            //      ,onPressed: (){
            //        print("programName${widget.hotelName}");
            //        Navigator.push(context, 
            //                 MaterialPageRoute(builder: (context)=> addTrain ()));}),),),
            ],),),
        ),)
      );
  }
}