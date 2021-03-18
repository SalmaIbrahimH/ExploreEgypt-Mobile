// To parse this JSON data, do
//
//     final wishList = wishListFromJson(jsonString);

import 'dart:convert';

List<WishList> wishListFromJson(String str) =>
    List<WishList>.from(json.decode(str).map((x) => WishList.fromJson(x)));

String wishListToJson(List<WishList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WishList {
  WishList({
    this.uId,
    this.arId,
    this.aricalTitle,
    this.id,
  });

  int uId;
  int arId;
  String aricalTitle;
  int id;

  factory WishList.fromJson(Map<String, dynamic> json) => WishList(
        uId: json["uID"],
        arId: json["ArID"],
        aricalTitle: json["AricalTitle"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "uID": uId,
        "ArID": arId,
        "AricalTitle": aricalTitle,
        "id": id,
      };
}
