import 'package:explore_egypt/localization/localization_constants.dart';
import 'package:explore_egypt/models/cityModal.dart';
import 'package:explore_egypt/models/hotelModel.dart';
import 'package:explore_egypt/models/trainModal.dart';
import 'package:explore_egypt/models/tripModel.dart';
import 'package:dio/dio.dart';

const String ar_url = 'https://explore-egypt-arabic-db.herokuapp.com';
const String en_url = 'https://explore-egypt-db.herokuapp.com';
String base_url;

class TripService {
  // String url = "https://explore-egypt-db.herokuapp.com";

  //// get trip program from json
  Future<List<Trip>> getTrips() async {
    // ignore: deprecated_member_use
    List<Trip> trips = [];
    Response response;
    Dio dio = new Dio();
    if (await getCurrentLang() == 'en') {
      base_url = en_url;
    } else {
      base_url = ar_url;
    }
    response = await dio.get("$base_url/programs");
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
    if (await getCurrentLang() == 'en') {
      base_url = en_url;
    } else {
      base_url = ar_url;
    }
    response = await dio.get("$base_url/city");
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
    if (await getCurrentLang() == 'en') {
      base_url = en_url;
    } else {
      base_url = ar_url;
    }
    response = await dio.get("$base_url/hotels?cityID=$cityvalue");
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
    if (await getCurrentLang() == 'en') {
      base_url = en_url;
    } else {
      base_url = ar_url;
    }
    response = await dio
        .get("$base_url/trains?destinationId=$destvalue&cityID=$cityvalue");
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
    if (await getCurrentLang() == 'en') {
      base_url = en_url;
    } else {
      base_url = ar_url;
    }
    response = await dio.get("$base_url/trains?cityID=$cityvalue");
    var data = response.data;
    // print(data);
    data.forEach((value) {
      train.add(Train.fromJson(value));
    });
    return train;
  }

//// post program to json
  Future<List<Trip>> save(
    int userId,
    String programName,
    String fromDate,
    String toDate,
    String cityId,
    String fromCityId,
    String toCityId,
    String hotelName,
    String roomPrice,
    String adress,
    String contactInfo,
    String trainNumber,
    String destination,
    String ticketPrice,
    String departureTime,
    String arrivalTime,
    String details,
  ) async {
    Response response;

    Dio dio = new Dio();
    if (await getCurrentLang() == 'en') {
      base_url = en_url;
    } else {
      base_url = ar_url;
    }
    response = await dio.post("$base_url/programs", data: {
      "userID": userId,
      "programName": programName,
      "fromDate": fromDate,
      "toDate": toDate,
      "selHotel": {
        "hotelName": hotelName,
        "roomPrice": roomPrice,
        "adress": adress,
        "contactInfo": contactInfo,
      },
      "selTrain": {
        "trainNumber": trainNumber,
        "destination": destination,
        "ticketPrice": ticketPrice,
        "departureTime": departureTime,
        "arrivalTime": arrivalTime,
        "details": details,
      },
    });
    var data = response.data;

    return data;
  }

  //// edit program to json
  Future<List<Trip>> edit(
    userId,
    String programName,
    String fromDate,
    String toDate,
    // String cityId,
    // String fromCityId,
    // String toCityId,
    int id,
    String hotelName,
    String roomPrice,
    String adress,
    String contactInfo,
    String trainNumber,
    String destination,
    String ticketPrice,
    String departureTime,
    String arrivalTime,
    String details,
  ) async {
    Response response;
    Dio dio = new Dio();
    if (await getCurrentLang() == 'en') {
      base_url = en_url;
    } else {
      base_url = ar_url;
    }
    response = await dio.put("$base_url/programs/$id", data: {
      "programName": programName,
      "fromDate": fromDate,
      "toDate": toDate,
      "selHotel": {
        "hotelName": hotelName,
        "roomPrice": roomPrice,
        "adress": adress,
        "contactInfo": contactInfo,
      },
      "selTrain": {
        "trainNumber": trainNumber,
        "destination": destination,
        "ticketPrice": ticketPrice,
        "departureTime": departureTime,
        "arrivalTime": arrivalTime,
        "details": details,
      },
    });
    var data = response.data;
    print("hi");
    return data;
  }

  //// Delet program
  Future<List<Trip>> delete(id) async {
    print("delete service$id");

    Response response;
    Dio dio = new Dio();
    if (await getCurrentLang() == 'en') {
      base_url = en_url;
    } else {
      base_url = ar_url;
    }
    response = await dio.delete("$base_url/programs/$id");
    var data = response.data;
    return data;
  }

  Future<List<Hotel>> getHotels() async {
    List<Hotel> hotels = [];
    Response response;
    Dio dio = new Dio();
    if (await getCurrentLang() == 'en') {
      base_url = en_url;
    } else {
      base_url = ar_url;
    }
    print('test before');
    response = await dio.get("$base_url/hotels");
    print('test after');
    var data = response.data;
    data.forEach((val) {
      hotels.add(Hotel.fromJson(val));
    });
    return hotels;
  }
}
