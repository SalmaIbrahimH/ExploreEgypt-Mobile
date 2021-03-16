// To parse this JSON data, do
//
//     final trip = tripFromJson(jsonString);

import 'dart:convert';

List<Trip> tripFromJson(String str) => List<Trip>.from(json.decode(str).map((x) => Trip.fromJson(x)));

String tripToJson(List<Trip> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Trip {
    Trip({
        this.userId,
        this.programName,
        this.fromDate,
        this.toDate,
        this.cityId,
        this.fromCityId,
        this.toCityId,
        this.selHotel,
        this.selTrain,
        this.id,
    });

    int userId;
    String programName;
    String fromDate;
    String toDate;
    String cityId;
    String fromCityId;
    String toCityId;
    SelHotel selHotel;
    SelTrain selTrain;
    int id;

    factory Trip.fromJson(Map<String, dynamic> json) => Trip(
        userId: json["userID"],
        programName: json["programName"],
        // fromDate: DateTime.parse(json["fromDate"]),
        // toDate: DateTime.parse(json["toDate"]),
        fromDate: json["fromDate"],
        toDate: json["toDate"],
        cityId: json["cityID"],
        fromCityId: json["fromCityID"],
        toCityId: json["toCityID"],
        selHotel: SelHotel.fromJson(json["selHotel"]),
        selTrain: SelTrain.fromJson(json["selTrain"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "userID": userId,
        "programName": programName,
        // "fromDate": "${fromDate.year.toString().padLeft(4, '0')}-${fromDate.month.toString().padLeft(2, '0')}-${fromDate.day.toString().padLeft(2, '0')}",
        // "toDate": "${toDate.year.toString().padLeft(4, '0')}-${toDate.month.toString().padLeft(2, '0')}-${toDate.day.toString().padLeft(2, '0')}",
        "fromDate": fromDate,
        "toDate": toDate,
        "cityID": cityId,
        "fromCityID": fromCityId,
        "toCityID": toCityId,
        "selHotel": selHotel.toJson(),
        "selTrain": selTrain.toJson(),
        "id": id,
    };
}

class SelHotel {
    SelHotel({
        this.hotelName,
        this.roomPrice,
        this.adress,
        this.contactInfo,
    });

    String hotelName;
    String roomPrice;
    String adress;
    String contactInfo;

    factory SelHotel.fromJson(Map<String, dynamic> json) => SelHotel(
        hotelName: json["hotelName"],
        roomPrice: json["roomPrice"],
        adress: json["adress"],
        contactInfo: json["contactInfo"],
    );

    Map<String, dynamic> toJson() => {
        "hotelName": hotelName,
        "roomPrice": roomPrice,
        "adress": adress,
        "contactInfo": contactInfo,
    };
}

class SelTrain {
    SelTrain({
        this.trainNumber,
        this.destination,
        this.ticketPrice,
        this.departureTime,
        this.arrivalTime,
        this.details,
    });

    String trainNumber;
    String destination;
    String ticketPrice;
    String departureTime;
    String arrivalTime;
    String details;

    factory SelTrain.fromJson(Map<String, dynamic> json) => SelTrain(
        trainNumber: json["trainNumber"],
        destination: json["destination"],
        ticketPrice: json["ticketPrice"],
        departureTime: json["departureTime"],
        arrivalTime: json["arrivalTime"],
        details: json["details"],
    );

    Map<String, dynamic> toJson() => {
        "trainNumber": trainNumber,
        "destination": destination,
        "ticketPrice": ticketPrice,
        "departureTime": departureTime,
        "arrivalTime": arrivalTime,
        "details": details,
    };
}
