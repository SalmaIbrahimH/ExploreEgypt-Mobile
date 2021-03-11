import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CultureArticle extends StatelessWidget {
  final String title;
  final String description;
  final List images;
  CultureArticle({this.title, this.description, this.images});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            description,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18.0,
            ),
          ),
          SizedBox(height: 15.0),
          CarouselSlider(
            items: List.generate(
              images.length,
              (i) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: AssetImage('images/${images[i]}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            options: CarouselOptions(
              height: 250.0,
              viewportFraction: 0.8,
              enableInfiniteScroll: false,
              disableCenter: true,
              enlargeCenterPage: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Divider(
              height: 1.0,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
