
import 'package:explore_egypt/models/cityModal.dart';
import 'package:explore_egypt/models/hotelModel.dart';
import 'package:explore_egypt/services/tripSer.dart';
// import 'package:explore_egypt/tripComponant/addTripform/addTrain.dart';
import 'package:explore_egypt/tripComponant/cards/hotelCard.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class City extends StatefulWidget {

  // final Trip ntrip;
  String programName;
  DateTime from;
  DateTime to;
  City({Key key,  this.programName,this.from,this.to}): super(key:key);


  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  
  // ignore: deprecated_member_use
  List<Cities> cityList = new List();
  // ignore: deprecated_member_use
  List<Hotel> hotelList = new List();
  String cityvalue ;
  String cityname;
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
  
  var formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Hotel"),
      ),
      body: Container(
        child: Form(
          child: Center(
          child:  Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Padding(padding: EdgeInsets.all(10),
            // child:Text("name ${ntrip.programNameController} "),),
            Padding(padding: EdgeInsets.all(10),
            child: DropdownButton(
              value: cityvalue ,
              items: cityList.map((value){
                return DropdownMenuItem(
                  child: Text(value.name, style: TextStyle(fontSize: 25),),
                value: value.id.toString(),);
              }).toList(),
              onChanged: (_value)=>{
                print(_value),
                setState((){
                  cityvalue=_value;
                   getHotelByIdFromJson();
                })
              },
              hint: Text("Select city",style: TextStyle(fontSize: 25),),
            ),),
            // Text(cityvalue),

          cityvalue !=null? Expanded(
            child: Container(
              //  height: 400,

               child: 
               FutureBuilder(
                //  future: getHotelByIdFromJson(),
                 builder:(context, snapshot){
                  //  print(snapshot.hasData);
                  //  if(snapshot.hasData){
                     if(hotelList.length == 0 ){
                       return Text("no hotels in this city");
                     }else
                     {return 
                     ListView.builder(
                       itemCount: hotelList.length,
                       itemBuilder: (BuildContext context,int index){
                         return
                         HotelCard(
                          from: widget.from,
                          to: widget.to,
                          programName: widget.programName,
                          hotelName: hotelList[index].hotelName,
                          roomPrice: hotelList[index].roomPrice,
                          contactInfo: hotelList[index].contactInfo,
                          adress: hotelList[index].adress,
                         );
                       } ,);}
                  //  }else  {return Text("no data found");}
                 } ,),
            ),
          ): Text("selct city first"),
            // Padding(padding: EdgeInsets.all(40),
            // child: Center(child:
             // ignore: deprecated_member_use
            //  RaisedButton(
            //      color: Colors.green,
            //      child: Text("Continue",style: TextStyle(color: Colors.white,fontSize: 20),)
            //      ,onPressed: (){
            //       //  print(widget.ntrip.from);
            //       //  print(widget.ntrip.to);
            //       // print("name${widget.name}");
            //        print(cityvalue);
            //       //  widget.ntrip.city= cityvalue;
            //        Navigator.push(context, 
            //                  MaterialPageRoute(builder: (context)=> addTrain()));}),),),
            ],),
            ),
        ),)
      );
            
      
    
  }
}