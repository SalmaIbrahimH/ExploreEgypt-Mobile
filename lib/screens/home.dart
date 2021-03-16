import 'package:explore_egypt/components/language.dart';
import 'package:explore_egypt/components/search.dart';
import 'package:explore_egypt/localization/localization_constants.dart';
import 'package:explore_egypt/main.dart';
import 'package:explore_egypt/models/hotelModel.dart';
import 'package:explore_egypt/models/users.dart';
import 'package:explore_egypt/profile.dart';
import 'package:explore_egypt/services/tripSer.dart';
import 'package:explore_egypt/services/usersService.dart';
import 'package:explore_egypt/tripComponant/myTrip.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../account.dart';
import '../login.dart';
import 'activities.dart';
import 'explore_screen.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SharedPreferences sharedPreferences;
  String userID;
  Users user;
  List<Hotel> hotels = [];

  Future getHotels() async {
    hotels = await TripService().getHotels();
    print(hotels);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // checkLoginStatus();
    getUser();
  }

  getUser() async {
    sharedPreferences = await SharedPreferences.getInstance();
    userID = utf8.decode(base64.decode(sharedPreferences.getString("token")));
    user = await UsersService().getUserByID(userID);
    print("user");
    setState(() {});
    checkLoginStatus();
    getHotels();
  }

  Future<bool> checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    print("token home");
    userID = utf8.decode(base64.decode(token));
    print(utf8.decode(base64.decode(token)));
    print(token);
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }

  int _selectedIndex = 0;
  // ignore: unused_field
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    Activities(),
    ExploreScreen(),
    MyTrip(),
    AccountScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // void _openEndDrawer() {
  //   _scaffoldKey.currentState.openEndDrawer();
  // }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  // Change language
  void _changeLanguage(Language language) async {
    Locale _temp = await setLocale(language.languageCode);

    MyApp.setLocale(context, _temp);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => super.widget));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 90,
        title: Text(
          getTranslated(context, 'explore_egypt'),
          style: GoogleFonts.playfairDisplay(
              fontSize: 32.6,
              fontWeight: FontWeight.w400,
              color: Colors.blue[800]),
        ),
        // centerTitle: true,
        actions: <Widget>[
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 50, right: 15),
          //   child: IconButton(
          //     icon: Icon(
          //       Icons.list,
          //       color: Colors.blueGrey[500],
          //       size: 40,
          //     ),
          //     onPressed: () {
          //       _openEndDrawer();
          //     },
          //   ),
          // )
          // ),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  size: 32.0,
                  color: Colors.blue[700],
                ),
                onPressed: () {
                  print(hotels);
                  showSearch(
                    context: context,
                    delegate: DataSearch(data: hotels),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: DropdownButton(
                  onChanged: (Language language) {
                    _changeLanguage(language);
                  },
                  underline: SizedBox(),
                  icon: Icon(
                    Icons.language,
                    color: Colors.blue[700],
                    size: 30.0,
                  ),
                  items: Language.languageList()
                      .map<DropdownMenuItem<Language>>((lang) =>
                          DropdownMenuItem(
                            value: lang,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  lang.flag,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                                Text(lang.name,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    )),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ],

        backgroundColor: Colors.grey[100],

        // title: const Text('Explore Egypt',
        // style: TextStyle(color: Colors.blue[700],fontSize: 30),),
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
                padding: const EdgeInsets.only(top: 30, left: 20),
                child: Text("xyz",
                    style: TextStyle(fontSize: 20, color: Colors.blue[700])),
              ),
              accountEmail: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text("xyz@gmail.com",
                    style: TextStyle(fontSize: 15, color: Colors.blue[700])),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey.shade50,
                foregroundColor: Colors.blue[700],
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext context) => ProfilePage()),
                    );
                  },
                  child: Text("",
                      style: TextStyle(fontSize: 20, color: Colors.blueGrey)),
                ),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: IconButton(
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.blue[700],
                      size: 40,
                    ),
                    onPressed: () {
                      _closeEndDrawer();
                    },
                  ),
                )
              ],
            ),
            userID != null
                ? InkWell(
                    onTap: () {
                      sharedPreferences.clear();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => LoginScreen()),
                          (Route<dynamic> route) => false);
                      setState(() {});
                    },
                    child: ListTile(
                        title: new Text(
                          "Log out",
                          style:
                              TextStyle(fontSize: 20, color: Colors.blueGrey),
                        ),
                        leading: new Icon(Icons.logout)),
                  )
                : InkWell(
                    onTap: () {
                      print("in");
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => LoginScreen()),
                          (Route<dynamic> route) => false);
                      setState(() {});
                    },
                    child: ListTile(
                      title: new Text(
                        "Sing In",
                        style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                      ),
                      leading: new Icon(Icons.login_rounded),
                    ),
                  ),
            Divider(
              height: 0.1,
            ),
            // ListTile(
            //   title: new Text("Primary",
            //       style: TextStyle(fontSize: 20, color: Colors.blueGrey)),
            //   leading: new Icon(Icons.inbox),
            // ),
            // MaterialButton(
            //   onPressed: () {
            //     sharedPreferences.clear();
            //     // sharedPreferences.commit();
            //     Navigator.pushAndRemoveUntil(
            //         context,
            //         MaterialPageRoute(
            //             builder: (BuildContext context) => LoginScreen()),
            //         (Route<dynamic> route) => false);
            //   },
            //   child: Text("Log Out", style: TextStyle(color: Colors.black)),
            // ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Activities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel_outlined),
            label: 'My trip',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.favorite),
          //   label: 'Favorite',
          // ),

          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'account',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[700],
        onTap: _onItemTapped,
        backgroundColor: Colors.grey.shade200,
        iconSize: 42,
        unselectedItemColor: Colors.grey[300],
      ),
      endDrawerEnableOpenDragGesture: true,
    );
  }
}
