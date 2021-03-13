import 'package:explore_egypt/models/cityModal.dart';
import 'package:explore_egypt/models/hotelModel.dart';
import 'package:explore_egypt/models/trainModal.dart';
import 'package:explore_egypt/models/tripModel.dart';
import 'package:dio/dio.dart';

class TripService {
  String url = "https://explore-egypt-db.herokuapp.com";

  //// get trip program from json
  Future<List<Trip>> getTrips() async {
    // ignore: deprecated_member_use
    List<Trip> trips = [];
    Response response;
    Dio dio = new Dio();
    response = await dio.get("$url/programs");
    var data = response.data;
    //  print(data);
    data.forEach((value) {
      trips.add(Trip.fromJson(value));
    });
    return trips;
  }

  ////get cities list from json
  Future<List<Cities>> getCties() async {

    List<Cities> city = [];
    Response response;
    Dio dio = new Dio();
    response = await dio.get("$url/city");
    var data = response.data;
    // print(data);
    data.forEach((value) {
      city.add(Cities.fromJson(value));
    });
    return city;
  }

  //// get Hotel By Id program from json
  Future<List<Hotel>> getHotelById(cityvalue) async {

    List<Hotel> hotel = [];
    Response response;
    Dio dio = new Dio();
    response = await dio.get("$url/hotels?cityID=$cityvalue");
    var data = response.data;
    // print(data);
    data.forEach((value) {
      hotel.add(Hotel.fromJson(value));
    });
    return hotel;
  }

  //// get train By Id program from jsom
  Future<List<Train>> getTrainById(destvalue, cityvalue) async {

    List<Train> train = [];
    Response response;
    Dio dio = new Dio();
    response =
        await dio.get("$url/trains?destinationId=$destvalue&cityID=$cityvalue");
    var data = response.data;
    // print(data);
    data.forEach((value) {
      train.add(Train.fromJson(value));
    });
    return train;
  }

//// get train By deperture city Id program
  Future<List<Train>> getTrainBycityId(cityvalue) async {

    List<Train> train = [];
    Response response;
    Dio dio = new Dio();
    response = await dio.get("$url/trains?cityID=$cityvalue");
    var data = response.data;
    // print(data);
    data.forEach((value) {
      train.add(Train.fromJson(value));
    });
    return train;
  }

//// post program to json
  Future<List<Trip>> save(
    String programName,
    String from,
    String to,
    String hotelName,
    String roomPrice,
    String adress,
    String trainNumber,
    String ticketPrice,
    String destination,

  ) async {

    Response response;
    Dio dio = new Dio();
    response = await dio.post("$url/programs", data: {
      "programName": programName,
      "from": from,
      "to": to,
      "selHotel": {
        "hotelName": hotelName,
        "roomPrice": roomPrice,
      },
      "selTrain"
          "trainNumber": trainNumber,
          "ticketPrice": ticketPrice,
          "destination": destination,
      "adress": adress,
    });
    var data = response.data;

    return data;
  }

  //// post program to json
  Future<List<Trip>> edit(int id,
    String programName,
    String from,
    String to,
    String hotelName,
    String roomPrice,
    String adress,
    String trainNumber,
    String ticketPrice,
    String destination,
  ) async {
 
    Response response;
    Dio dio = new Dio();
    response = await dio.put("$url/programs/$id", data: {
      "programName": programName,
      "from": from,
      "to": to,
      "selHotel": {
        "hotelName": hotelName,
        "roomPrice": roomPrice,
      },
      "selTrain"
          "trainNumber": trainNumber,
          "ticketPrice": ticketPrice,
          "destination": destination,
      "adress": adress,
    });
    var data = response.data;

    return data;
  }

  //// Delet program
  Future<List<Trip>> delete(id) async {
    print("delete service$id");

    Response response;
    Dio dio = new Dio();
    response = await dio.delete("$url/programs/$id");
    var data = response.data;
    return data;
  }
}

