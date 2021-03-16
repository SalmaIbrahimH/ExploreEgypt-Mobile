import 'dart:ui';

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String img;
  final String title;
  final String description;
  CustomCard(
      {@required this.img, @required this.title, @required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                title,
                style: TextStyle(fontSize: 24.0),
              ),
              padding: EdgeInsets.all(6.0),
            ),
            // Container(
            //   child: IconButton(
            //     icon: icon,
            //     onPressed: () {},
            //   ),
            //   padding: EdgeInsets.all(6.0),
            // ),
            Container(
              height: 212.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage(
                    'images/$img',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.0),
                        topRight: Radius.circular(18.0),
                      ),
                      child: BackdropFilter(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            description,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        filter: ImageFilter.blur(
                          sigmaX: 15,
                          sigmaY: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
