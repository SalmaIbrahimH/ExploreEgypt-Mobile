import 'package:flutter/material.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0',
      style: optionStyle,
    ),
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
          padding: const EdgeInsets.only(top: 45),
          child: Image.asset(
            'assets/try.png',
            height: 70,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 50, right: 15),
            child: IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.blueGrey[500],
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
        // style: TextStyle(color: Colors.blueGrey,fontSize: 30),),
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
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey)),
              ),
              accountEmail: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text("xyz@gmail.com",
                    style: TextStyle(fontSize: 15, color: Colors.blueGrey)),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey.shade50,
                foregroundColor: Colors.blueGrey,
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
                      color: Colors.blueGrey[500],
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
                style: TextStyle(fontSize: 20, color: Colors.blueGrey),
              ),
              leading: new Icon(Icons.mail),
            ),
            Divider(
              height: 0.1,
            ),
            ListTile(
              title: new Text("Primary",
                  style: TextStyle(fontSize: 20, color: Colors.blueGrey)),
              leading: new Icon(Icons.inbox),
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
        selectedItemColor: Colors.blueGrey[400],
        onTap: _onItemTapped,
        backgroundColor: Colors.grey.shade200,
        iconSize: 42,
        unselectedItemColor: Colors.blueGrey[100],
      ),
      endDrawerEnableOpenDragGesture: true,
    );
  }
}
