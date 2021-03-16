import 'package:explore_egypt/localization/localization_constants.dart';
import 'package:explore_egypt/models/hotelModel.dart';
import 'package:explore_egypt/tripComponant/addTripform/addTrip.dart';
import 'package:flutter/material.dart';

class SearchResults extends StatelessWidget {
  final Hotel hotel;
  SearchResults({this.hotel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text(
            getTranslated(context, 'search_result'),
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.7),
                ])),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    hotel.hotelName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 26,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        hotel.city.toString().substring(5),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: 'Room Price  ',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    TextSpan(
                        text: '\$${hotel.roomPrice}',
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow[700],
                        ))
                  ])),
                  SizedBox(height: 10.0),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: 'Contact Info  ',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    TextSpan(
                        text: '${hotel.contactInfo}',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          // color: Colors.yellow[700],
                        ))
                  ])),
                  SizedBox(height: 25.0),
                  Material(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) => NewTrip()),
                        );
                      },
                      height: 70.0,
                      minWidth: MediaQuery.of(context).size.width,
                      child: Text(
                        getTranslated(context, 'design_trip'),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(hotel.img),
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
