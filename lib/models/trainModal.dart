// To parse this JSON data, do
//
//     final train = trainFromJson(jsonString);

import 'dart:convert';

List<Train> trainFromJson(String str) => List<Train>.from(json.decode(str).map((x) => Train.fromJson(x)));

String trainToJson(List<Train> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Train {
    Train({
        this.trainNumber,
        this.city,
        this.cityId,
        this.ticketPrice,
        this.destination,
        this.destinationId,
        this.departureTime,
        this.arrivalTime,
        this.details,
        this.id,
    });

    String trainNumber;
    // City city;
    String city;
    dynamic cityId;
    String ticketPrice;
    // City destination;
    String destination;
    String destinationId;
    String departureTime;
    String arrivalTime;
    String details;
    int id;

    factory Train.fromJson(Map<String, dynamic> json) => Train(
        trainNumber: json["trainNumber"],
        // city: cityValues.map[json["city"]],
        city: json["city"],
        cityId: json["cityID"],
        ticketPrice: json["ticketPrice"],
        // destination: cityValues.map[json["destination"]],
        destination: json["destination"],
        destinationId: json["destinationId"],
        departureTime: json["departureTime"],
        arrivalTime: json["arrivalTime"],
        details: json["details"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "trainNumber": trainNumber,
        // "city": cityValues.reverse[city],
        "city": city,
        "cityID": cityId,
        "ticketPrice": ticketPrice,
        // "destination": cityValues.reverse[destination],
        "destination": destination,

        "destinationId": destinationId,
        "departureTime": departureTime,
        "arrivalTime": arrivalTime,
        "details": details,
        "id": id,
    };
}

enum City { CAIRO, ALEXANDRIA, ASWAN }

final cityValues = EnumValues({
    "Alexandria": City.ALEXANDRIA,
    "Aswan": City.ASWAN,
    "cairo": City.CAIRO
});


class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
