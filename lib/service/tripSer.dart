import 'package:explore_egypt/model/cityModal.dart';
import 'package:explore_egypt/model/hotelModel.dart';
import 'package:explore_egypt/model/tripModel.dart';
import 'package:dio/dio.dart';

class TripService {
  String url = "https://explore-egypt-db.herokuapp.com/programs";

  //// get trip program
  Future<List<Trip>> getTrips(id) async {
    List<Trip> trips = [];
    Response response;
    Dio dio = new Dio();
    response = await dio.get("$url?userID=$id");
    var data = response.data;
    data.forEach((value) {
      trips.add(Trip.fromJson(value));
    });
    return trips;
  }

  String curl = "https://explore-egypt-db.herokuapp.com/city";
  ////get cities
  Future<List<Cities>> getCties() async {
    // ignore: deprecated_member_use
    List<Cities> city = new List();
    Response response;
    Dio dio = new Dio();
    response = await dio.get(curl);
    var data = response.data;
    // print(data);
    data.forEach((value) {
      city.add(Cities.fromJson(value));
    });
    return city;
  }

  String hurl = "https://explore-egypt-db.herokuapp.com/hotels";

  //// get Hotel By Id program
  Future<List<Hotel>> getHotelById(cityvalue) async {
    // ignore: deprecated_member_use
    List<Hotel> hotel = new List();
    Response response;
    Dio dio = new Dio();
    response = await dio.get("$hurl?cityID=$cityvalue");
    var data = response.data;
    // print(data);
    data.forEach((value) {
      hotel.add(Hotel.fromJson(value));
    });
    return hotel;
  }
}
