// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

DataModel DataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String DataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.email,
    required this.password,

  });

  String email;
  String password;


  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    email: json["email"],
    password: json["password"],

  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,

  };
}
