// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    this.firstName,
    this.lastName,
    this.city,
    this.email,
    this.password,
    this.id,
    this.confirmPassword,
  });

  String firstName;
  String lastName;
  String city;
  String email;
  String password;
  int id;
  String confirmPassword;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        firstName: json["firstName"],
        lastName: json["lastName"],
        city: json["city"],
        email: json["email"],
        password: json["password"],
        id: json["id"],
        confirmPassword:
            json["confirmPassword"] == null ? null : json["confirmPassword"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "city": city,
        "email": email,
        "password": password,
        "id": id,
        "confirmPassword": confirmPassword == null ? null : confirmPassword,
      };
}
