// To parse this JSON data, do
//
//     final trip = tripFromJson(jsonString);

import 'dart:convert';

List<Trip> tripFromJson(String str) => List<Trip>.from(json.decode(str).map((x) => Trip.fromJson(x)));

String tripToJson(List<Trip> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Trip {
    Trip({
        this.programName,
        this.from,
        this.to,
        this.city,
        this.fromCity,
        this.toCity,
        this.selHotel,
        this.selTrain,
        this.id,
        this.userId,
    });

    String programName;
    DateTime from;
    DateTime to;
    String city;
    String fromCity;
    String toCity;
    SelHotel selHotel;
    SelTrain selTrain;
    int id;
    int userId;

    factory Trip.fromJson(Map<String, dynamic> json) => Trip(
        programName: json["programName"],
        from: DateTime.parse(json["from"]),
        to: DateTime.parse(json["to"]),
        // from: json["from"],
        // to: json["to"],
        city: json["city"],
        fromCity: json["fromCity"] == null ? null : json["fromCity"],
        toCity: json["toCity"] == null ? null : json["toCity"],
        selHotel: SelHotel.fromJson(json["selHotel"]),
        selTrain: SelTrain.fromJson(json["selTrain"]),
        id: json["id"],
        userId: json["userID"] == null ? null : json["userID"],
    );

    Map<String, dynamic> toJson() => {
        "programName": programName,
        "from": "${from.year.toString().padLeft(4, '0')}-${from.month.toString().padLeft(2, '0')}-${from.day.toString().padLeft(2, '0')}",
        "to": "${to.year.toString().padLeft(4, '0')}-${to.month.toString().padLeft(2, '0')}-${to.day.toString().padLeft(2, '0')}",
        // "from": from,
        // "to": to,
        "city": city,
        "fromCity": fromCity == null ? null : fromCity,
        "toCity": toCity == null ? null : toCity,
        "selHotel": selHotel.toJson(),
        "selTrain": selTrain.toJson(),
        "id": id,
        "userID": userId == null ? null : userId,
    };
}

class SelHotel {
    SelHotel({
        this.hotelName,
        this.roomPrice,
    });

    String hotelName;
    String roomPrice;

    factory SelHotel.fromJson(Map<String, dynamic> json) => SelHotel(
        hotelName: json["hotelName"],
        roomPrice: json["roomPrice"],
    );

    Map<String, dynamic> toJson() => {
        "hotelName": hotelName,
        "roomPrice": roomPrice,
    };
}

class SelTrain {
    SelTrain({
        this.trainNumber,
        this.destination,
        this.ticketPrice,
    });

    dynamic trainNumber;
    String destination;
    String ticketPrice;

    factory SelTrain.fromJson(Map<String, dynamic> json) => SelTrain(
        trainNumber: json["trainNumber"],
        destination: json["destination"],
        ticketPrice: json["ticketPrice"] == null ? null : json["ticketPrice"],
    );

    Map<String, dynamic> toJson() => {
        "trainNumber": trainNumber,
        "destination": destination,
        "ticketPrice": ticketPrice == null ? null : ticketPrice,
    };
}
