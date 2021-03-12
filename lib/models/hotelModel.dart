// To parse this JSON data, do
//
//     final hotel = hotelFromJson(jsonString);

import 'dart:convert';

List<Hotel> hotelFromJson(String str) => List<Hotel>.from(json.decode(str).map((x) => Hotel.fromJson(x)));

String hotelToJson(List<Hotel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Hotel {
    Hotel({
        this.id,
        this.hotelName,
        this.city,
        this.roomPrice,
        this.contactInfo,
        this.adress,
        this.cityId,
        this.img,
    });

    int id;
    String hotelName;
    City city;
    String roomPrice;
    String contactInfo;
    String adress;
    String cityId;
    String img;

    factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        id: json["id"],
        hotelName: json["hotelName"],
        city: cityValues.map[json["city"]],
        roomPrice: json["roomPrice"],
        contactInfo: json["contactInfo"],
        adress: json["adress"],
        cityId: json["cityID"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "hotelName": hotelName,
        "city": cityValues.reverse[city],
        "roomPrice": roomPrice,
        "contactInfo": contactInfo,
        "adress": adress,
        "cityID": cityId,
        "img": img,
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
