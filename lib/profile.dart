import 'dart:convert';
import 'package:explore_egypt/service/usersService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Progress.dart';
import 'home.dart';
import 'models/users.dart';

class ProfilePage extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  String userID;
  final FocusNode myFocusNode = FocusNode();
  TextEditingController fNameController = new TextEditingController();
  var lNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPassController = new TextEditingController();
  SharedPreferences sharedPreferences;
  bool isApiCallProcess = false;
  Users user;
  @override
  void initState() {
    super.initState();
    isApiCallProcess = true;
    checkLoginStatus();
    getuserByID();
  }

  Future checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    userID = utf8.decode(base64.decode(token));
    print(userID);
    if (userID == null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => Home()),
      );
      final snackBar = SnackBar(content: Text('you should be logged'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  // getFav() async {
  //   bool res = await UsersService().isFav(5, 8, "explorDep");
  //   print("faaaaaaa");
  //   print(res);
  // }

  update(String fname, String lname, String email, String pass, String conpass,
      String city) async {
    Users user = new Users(
        email: email.trim(),
        password: pass.trim(),
        firstName: fname.trim(),
        lastName: lname.trim(),
        confirmPassword: conpass.trim(),
        city: city.trim());
    var updateDone = await UsersService().update(user, userID);

    if (updateDone) {
      final snackBar = SnackBar(content: Text('update done'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final snackBar = SnackBar(content: Text('erooooooooooooooooooooor'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  getuserByID() async {
    user = await UsersService().getUserByID(userID);
    isApiCallProcess = false;
    print("user");
    print(user);

    setState(() {
      fNameController.text = user.firstName;
      lNameController.text = user.lastName;
      emailController.text = user.email;
      cityController.text = user.city;
      passwordController.text = user.password;
      confirmPassController.text = user.confirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Progress(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return new Scaffold(
        // appBar: AppBar(
        //   // backgroundColor: Colors.white,
        //   // color: Colors.blue[600],
        //   title: Text(
        //     "My Profile",
        //     style: TextStyle(
        //         // color: Colors.blue[600],
        //         ),
        //   ),
        // ),
        body: new Container(
      child: new ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              new Container(
                width: MediaQuery.of(context).size.width,
                height: 60.0,
                decoration: BoxDecoration(
                    color: Colors.blue[600],
                    borderRadius: BorderRadius.only(
                        // bottomRight: Radius.circular(500.0),
                        // bottomLeft: Radius.circular(50.0),
                        )),

                // color: Colors.white,
                // child: new Column(
                //   children: <Widget>[
                //     Padding(
                //         padding: EdgeInsets.only(left: 20.0, top: 20.0),
                //         child: new Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: <Widget>[
                //             new Icon(
                //               Icons.arrow_back_ios,
                //               color: Colors.black,
                //               size: 22.0,
                //             ),
                //             Padding(
                //               padding: EdgeInsets.only(left: 25.0),
                //               child: new Text('PROFILE',
                //                   style: TextStyle(
                //                       fontWeight: FontWeight.bold,
                //                       fontSize: 20.0,
                //                       fontFamily: 'sans-serif-light',
                //                       color: Colors.black)),
                //             )
                //           ],
                //         )),
                //   ],
                // ),
              ),
              new Container(
                decoration: BoxDecoration(
                    color: Colors.blue[600],
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(500.0),
                      // bottomLeft: Radius.circular(100.0),
                    )),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Parsonal Information',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  _status ? _getEditIcon() : new Container(),
                                ],
                              )
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Frist Name',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextFormField(
                                  controller: fNameController,
                                  //  onChanged: (_value)=>{
                                  //         print(_value),
                                  //         setState((){
                                  //           fNameController=
                                  //         })
                                  //       },
                                  decoration: const InputDecoration(),
                                  enabled: !_status,
                                  autofocus: !_status,
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Last Name',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: lNameController,
                                  decoration: const InputDecoration(
                                    hintText: "Enter Your Name",
                                  ),
                                  enabled: !_status,
                                  autofocus: !_status,
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Email',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                      hintText: "Enter Email ID"),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Password',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: passwordController,
                                  decoration: const InputDecoration(
                                      hintText: "Enter password"),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'City',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: cityController,
                                  decoration: const InputDecoration(
                                      hintText: "Enter your city"),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              !_status ? _getActionButtons() : new Container(),
            ],
          ),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Save"),
                textColor: Colors.white,
                color: Colors.blue[600],
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                    update(
                      fNameController.text,
                      lNameController.text,
                      emailController.text,
                      passwordController.text,
                      confirmPassController.text,
                      cityController.text,
                    );
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Cancel"),
                textColor: Colors.white,
                color: Colors.red[200],
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.white,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.blue[600],
          size: 18.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}

// import 'package:flutter/material.dart';

// class ProfileFirst extends StatefulWidget {
//   ProfileFirst({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _ProfileFirstState createState() => _ProfileFirstState();
// }

// class _ProfileFirstState extends State<ProfileFirst> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         clipBehavior: Clip.none,
//         children: <Widget>[
//           Container(
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//                 color: Colors.blue[600],
//                 borderRadius: BorderRadius.only(
//                   bottomRight: Radius.circular(.0),
//                   bottomLeft: Radius.circular(30.0),
//                 )),
//           ),
//         ],
//       ),
//     );
//   }
// }
