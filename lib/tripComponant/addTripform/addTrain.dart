
import 'package:explore_egypt/model/cityModal.dart';
import 'package:explore_egypt/service/tripSer.dart';
import 'package:explore_egypt/tripComponant/cards/trainCard.dart';
import 'package:flutter/material.dart';

class Train extends StatefulWidget {
  
  @override
  _TrainState createState() => _TrainState();
}

class _TrainState extends State<Train> {
  // ignore: deprecated_member_use
  List<Cities> cityList = new List();
  String cityValue ;
  @override

  void initState() {
    super.initState();
    getCityFromJson();
  }

  getCityFromJson() async {
    cityList = await TripService().getCties();
    setState(() {});
  }
  String staticValue="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Train"),
      ),
      body: Container(
        child: Center(
        child:  Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Padding(padding: EdgeInsets.all(10),
          child: DropdownButton(
            value: cityValue ,
            items: cityList.map((value){
              return DropdownMenuItem(
                child: Text(value.name),
              value: value.id.toString(),);
            }).toList(),
            onChanged: (_value)=>{
              print(_value),
              setState((){
                cityValue=_value;
              })
            },
            hint: Text("Select city",style: TextStyle(fontSize: 25),),
          ),),
          Padding(padding: EdgeInsets.all(10),
          child: DropdownButton<String>(
            
            items: [
              DropdownMenuItem<String>(
                value: "1",
                child: Center(child: Text("Cairo"),)),
                DropdownMenuItem<String>(
                value: "2",
                child: Center(child: Text("Alex"),)),
                DropdownMenuItem<String>(
                value: "3",
                child: Center(child: Text("Aswan"),)),
            ],
            onChanged: (_value)=>{
              print(_value.toString()),
              setState((){
                staticValue=_value;
              })
            },
            hint: Text("Select destination",style: TextStyle(fontSize: 25),),
          ),),
          
          TrainCard(),
          TrainCard(),
          Padding(padding: EdgeInsets.all(40),
          child: Center(child:
           // ignore: deprecated_member_use
           RaisedButton(
               color: Colors.green,
               child: Text("Continue",style: TextStyle(color: Colors.white,fontSize: 20),)
               ,onPressed: (){Navigator.push(context, 
                          MaterialPageRoute(builder: (context)=> Train()));}),),),
          ],),),)
      );
  }
}