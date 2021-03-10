import 'package:flutter/material.dart';

class TrainCard extends StatefulWidget {
  @override
  _TrainCardState createState() => _TrainCardState();
}

class _TrainCardState extends State<TrainCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Card(
            child: Padding(
                padding: EdgeInsets.all(8),
                child: Stack(children: <Widget>[
                  Container(
                    height: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                            colors: [Colors.lightBlue.shade200, Colors.blue],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 6,
                            offset: Offset(0, 6),
                          )
                        ]),
                  ),
                  Positioned.fill(
                    child: Column(
                      children: [
                         Row(
                          children: [
                          Padding(padding: EdgeInsets.all(18  ),
                          child:Icon(Icons.train,size:30,color: Colors.white,),),
                          Padding(
                          padding: EdgeInsets.all(10),
                          child: Text("train Number", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 25),),
                        ),
                        ],
                          
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                               flex: 4,
                               child: Column(
                                 children: [Icon(
                                Icons.departure_board,
                                size: 15,
                                color: Colors.white,
                              ),
                              Text("Cairo", style: TextStyle(color: Colors.white,fontSize: 18),),
                              Text("12:00am", style: TextStyle(color: Colors.white,fontSize: 18),),
                              ],),
                            ),
                            Expanded(
                              flex: 4,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.arrow_forward,size: 30, color: Colors.white,)
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                     Icon(Icons.arrow_back ,size: 30, color: Colors.white,) 
                                    ],
                                  ),
                                ],
                              ),
                            ),
                             Expanded(
                               flex: 4,
                               child: Column(
                                 children: [Icon(
                                Icons.departure_board,
                                size: 15,
                                color: Colors.white,
                              ),
                              Text("Cairo", style: TextStyle(color: Colors.white,fontSize: 18),),
                              Text("12:00am", style: TextStyle(color: Colors.white,fontSize: 18),),
                              ],),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ]))));
  }
}
