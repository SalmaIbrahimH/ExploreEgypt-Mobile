import 'package:explore_egypt/models/hotelModel.dart';
import 'package:explore_egypt/screens/search_results.dart';
import 'package:explore_egypt/services/tripSer.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  List<Hotel> data = [];
  DataSearch({this.data});
  String get searchFieldLabel => 'Search Hotels';

  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for appbar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Left icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // results based on the selection
    return Center(
      child: Card(
        child: Text(''),
        color: Colors.blue[900],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show search suggestions
    final List<Hotel> suggestionList = query.isEmpty
        ? data
        : data
            .where((el) =>
                el.hotelName.toLowerCase().startsWith(query.toLowerCase()) ||
                el.city
                    .toString()
                    .substring(5)
                    .toLowerCase()
                    .startsWith(query.toLowerCase()))
            .toList();
    return ListView.builder(
      itemBuilder: (context, index) => Column(
        children: [
          ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => SearchResults(
                            hotel: suggestionList[index],
                          )),
                );
              },
              leading: Container(
                padding: EdgeInsets.fromLTRB(5.0, 8.0, 5.0, 8.0),
                child: Image(
                  image: AssetImage('images/hotel.png'),
                  fit: BoxFit.cover,
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    suggestionList[index].hotelName,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    suggestionList[index].city.toString().substring(5),
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
          Divider(
            color: Colors.grey,
          )
        ],
      ),
      itemCount: suggestionList.length,
    );
  }
}

// RichText(
//   text: TextSpan(
//     text:
//         suggestionList[index].hotelName.substring(0, query.length),
//     style: TextStyle(
//       color: Colors.black,
//       fontWeight: FontWeight.bold,
//       fontSize: 20.0,
//     ),
//     children: [
//       TextSpan(
//         text:
//             suggestionList[index].hotelName.substring(query.length),
//         style: TextStyle(
//             color: Colors.grey,
//             fontWeight: FontWeight.normal,
//             fontSize: 20.0),
//       )
//     ],
//   ),
// ),
