import 'dart:convert';

Country contactFromJson(String str) => Country.fromJson(json.decode(str));

String contactToJson(Country data) => json.encode(data.toJson());

class Country {
  Country({
    required String name,
    required String capital,
  });

  late String name;
  late String capital;

  factory Country.fromJson(Map<String, dynamic> json) =>
      Country(name: json["name"], capital: json["email"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": capital,
      };
}
