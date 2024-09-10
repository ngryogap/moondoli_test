// To parse this JSON data, do
//
//     final countriesModel = countriesModelFromJson(jsonString);

import 'dart:convert';

List<CountriesModel> countriesModelFromJson(String str) =>
    List<CountriesModel>.from(
        json.decode(str).map((x) => CountriesModel.fromJson(x)));

String countriesModelToJson(List<CountriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountriesModel {
  String? name;
  String? currency;
  String? iso2;
  String? iso3;

  CountriesModel({
    this.name,
    this.currency,
    this.iso2,
    this.iso3,
  });

  factory CountriesModel.fromJson(Map<String, dynamic> json) => CountriesModel(
        name: json["name"],
        currency: json["currency"],
        iso2: json["iso2"],
        iso3: json["iso3"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "currency": currency,
        "iso2": iso2,
        "iso3": iso3,
      };
}
