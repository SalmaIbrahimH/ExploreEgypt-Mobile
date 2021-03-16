import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:explore_egypt/model/tripModel.dart';

import 'package:explore_egypt/models/users.dart';

import 'package:shared_preferences/shared_preferences.dart';

class UsersService {
  String url = "https://explore-egypt-db.herokuapp.com/Users";
  bool passErorr = false;
  get http => null;

  Future<List<Users>> getUsers() async {
    List<Users> users = [];
    Response response;
    Dio dio = new Dio();
    response = await dio.get(url);
    var data = response.data;
    print(data);
    data.forEach((value) {
      users.add(Users.fromJson(value));
    });

    return users;
  }

  Future getUserByID(id) async {
    Users user = new Users();
    Response response;
    Dio dio = new Dio();
    response = await dio.get("$url/$id");
    var data = response.data;
    user = Users.fromJson(data);
    print(data);
    return user;
  }

  Future<bool> setUser(Users users) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    // var jsonResponse;
    Response response;
    Dio dio = new Dio();
    response = await dio.post(url, data: users.toJson());
    print(response.data["id"]);
    sharedPreferences.setInt('token', response.data["id"]);
    print(sharedPreferences.getInt('token') ?? 0);
    return true;
  }

  // signInnn(Users users) async {
  //   print("asmaa");
  //   // var sharedPreferences = await SharedPreferences.getInstance();
  //   Map data = users.toJson();
  //   // var jsonResponse = {};
  //   var response = await http
  //       .post("https://explore-egypt-db.herokuapp.com/Users", body: data);
  //   if (response.body != null) {
  //     // jsonResponse = json.decode(response.body);
  //     // if (jsonResponse != null) {
  //     ////////////////////  دا اللي بيعمل التوكن والمشكلة///////////////
  //     // sharedPreferences.setString("token", jsonResponse['token']);

  //     return true;
  //   } else {
  //     print("errooooooooo");
  //     return false;
  //   }
  // }

  Future<bool> signIn(String email, String pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<Users> data = await getUsers();
    var datalist = data.where((item) => (item.email.contains(email)));
    // print(data.firstWhere((element) => element.email == email).id);
    if (datalist.length >= 1) {
      var password = datalist.where((item) => (item.password.contains(pass)));
      print(password.length);
      if (password.length >= 1) {
        var token = data.firstWhere((element) => element.email == email).id;
        String encoded = base64.encode(utf8.encode(token.toString()));
        sharedPreferences.setString('token', encoded);
        print(sharedPreferences.getString("token"));
        print(utf8.decode(base64.decode(encoded)));
        return true;
      } else {
        passErorr = true;
        return false;
      }
    }
    print("errooooooooo");
    return false;
  }

  Future<bool> update(Users users, id) async {
    Response response;
    Dio dio = new Dio();
    response = await dio.put("$url/$id", data: users.toJson());
    print(response.data);
    return true;
  }

  Future<List<Trip>> getTripByUserID(id) async {
    List<Trip> trips = [];
    Response response;
    Dio dio = new Dio();
    response = await dio.get("$url/programs");
    var data = response.data;
    print(data);
    data.forEach((value) {
      trips.add(Trip.fromJson(value));
    });
    return trips;
  }
}
