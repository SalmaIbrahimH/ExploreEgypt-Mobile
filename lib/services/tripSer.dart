import 'package:explore_egypt/models/cityModal.dart';
import 'package:explore_egypt/models/hotelModel.dart';
import 'package:explore_egypt/models/trainModal.dart';
import 'package:explore_egypt/models/tripModel.dart';
import 'package:dio/dio.dart';

class TripService {
  String url = "https://explore-egypt-db.herokuapp.com";

  //// get trip program
  Future<List<Trip>> getTrips() async {
    // ignore: deprecated_member_use
    List<Trip> trips = new List();
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

  ////get cities
  Future<List<Cities>> getCties() async {
    // ignore: deprecated_member_use
    List<Cities> city = new List();
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

  //// get Hotel By Id program
  Future<List<Hotel>> getHotelById(cityvalue) async {
    // ignore: deprecated_member_use
    List<Hotel> hotel = new List();
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

  //// get train By Id program
  Future<List<Train>> getTrainById(destvalue, cityvalue) async {
    // ignore: deprecated_member_use
    List<Train> train = new List();
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

//// get train By Id program
  Future<List<Train>> getTrainBycityId(cityvalue) async {
    // ignore: deprecated_member_use
    List<Train> train = new List();
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

//// post program
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
    // ignore: deprecated_member_use
    // List<Trip> train= new List();
    Response response;
    Dio dio = new Dio();
    response = await dio.post("$url/programs", data: {
      "programName": programName,
      "from": from,
      "to": to,
      "hotelName": hotelName,
      "roomPrice": roomPrice,
      "adress": adress,
      "trainNumber": trainNumber,
      "ticketPrice": ticketPrice,
      "destination": destination,
    });
    var data = response.data;
    // print(data);
    print("helllllo");
    // data.forEach((value){
    //   train.add(Trip.fromJson(value));
    // });
    return data;
  }

//   Future<bool> save(String programName, DateTime from, DateTime to,
//   // String hotelName, String roomPrice,String adress,
//   // String trainNumber, String ticketPrice, String destination,
//   ) async {
//     // ignore: deprecated_member_use
//     List<Trip> nProgram= new List();
//     Trip program =new Trip( programName:programName, from:from,to:to,
// // hotelName: hotelName,roomPrice:roomPrice,adress:adress,
// //    trainNumber:trainNumber,  ticketPrice:ticketPrice,  destination:destination
// );
//     print("hello");
//     Response response;
//     Dio dio = new Dio();
//     print("hello");
//     response = await dio.post("$url/programs",
//     data:program);
//     var data = response.data;
//      print(data);
//      print("hello");
//     // data.forEach((value){
//     //   nProgram.add(Trip.fromJson(value));
//     // });
//     return true;
// }

  Future<List<Hotel>> getHotels() async {
    List<Hotel> hotels = new List();
    Response response;
    Dio dio = new Dio();
    print('test before');
    response = await dio.get("$url/hotels");
    print('test after');
    var data = response.data;
    data.forEach((val) {
      hotels.add(Hotel.fromJson(val));
    });
    return hotels;
  }
}
