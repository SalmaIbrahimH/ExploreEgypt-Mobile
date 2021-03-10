import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'activities.dart';
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> _widgetOptions = <Widget>[
    Activities(),
    Text(
      'Index 1',
      style: optionStyle,
    ),
    Text(
      'Index 2',
      style: optionStyle,
    ),
    Text(
      'Index 3',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _openEndDrawer() {
    _scaffoldKey.currentState.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 130,
        
        title: Padding(
          padding: const EdgeInsets.only(top: 25),
        
          child: Text('Explore Egypt',style: GoogleFonts.playfairDisplay(color:Colors.blue[600],fontSize: 40,fontWeight: FontWeight.w500 ),)
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 50, right: 15),
            child: IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.blue[600],
                size: 40,
              ),
              onPressed: () {
                _openEndDrawer();
              },
            ),
          )
        ],

        backgroundColor: Colors.grey[100],

        // title: const Text('Explore Egypt',
        // style: TextStyle(color: Colors.greyGrey,fontSize: 30),),
      ),
      endDrawer: Drawer(
        elevation: 16.0,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
              accountName: Padding(
                padding: const EdgeInsets.only(top: 30,left: 20),
                child: Text("xyz",
                    style: TextStyle(fontSize: 20, color: Colors.blue[600])),
              ),
              accountEmail: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text("xyz@gmail.com",
                    style: TextStyle(fontSize: 15, color: Colors.blue[600])),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey.shade50,
                foregroundColor: Colors.blue[600],
                child: Text(
                  "image",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: IconButton(
                    icon: Icon(
                      Icons.cancel,
                      color:Colors.blue[600],
                      size: 40,
                    ),
                    onPressed: () {
                      _closeEndDrawer();
                    },
                  ),
                )
              ],
            ),
            ListTile(
              title: new Text(
                "All Inboxes",
                style: TextStyle(fontSize: 20, color: Colors.blue[600]),
              ),
              leading: new Icon(Icons.mail,color: Colors.blue[600]),
            ),
            Divider(
              height: 0.1,
            ),
            ListTile(
              title: new Text("Primary",
                  style: TextStyle(fontSize: 20, color: Colors.blue[600])),
              leading: new Icon(Icons.inbox,color: Colors.blue[600],),
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel_outlined),
            label: 'My trip',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:Colors.blue[500],
        onTap: _onItemTapped,
        backgroundColor: Colors.grey.shade200,
        iconSize: 42,
        unselectedItemColor: Colors.grey[300],
      ),
      endDrawerEnableOpenDragGesture: true,
    );
  }
}
