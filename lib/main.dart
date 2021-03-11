import 'package:explore_egypt/login.dart';
import 'package:explore_egypt/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getInt("token");
    print("token main");
    print(token);
    if (token == null) {
      print("go");
      Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Home();
    //  return widget.id == 3 ? Scaffold(/*version 1*/) : Scaffold(/*version 2*/);
  }
}
