import 'dart:convert';

Country countryFromJson(String str) => Country.fromJson(json.decode(str));

String countryToJson(Country data) => json.encode(data.toJson());

class Country {
  Country({
    required String name,
    required String capital,
  });

  late String name;
  late String capital;

  factory Country.fromJson(Map<String, dynamic> json) =>
      Country(name: json["name"], capital: json["capital"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "capital": capital,
      };
}
