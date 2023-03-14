// To parse this JSON data, do
//
//     final ewuMap = ewuMapFromJson(jsonString);

import 'dart:convert';

import 'sub.models/floor.dart';

class EwuMap {
  EwuMap({
    required this.name,
    required this.version,
    required this.floors,
  });

  final String name;
  final double version;
  final List<Floor> floors;

  EwuMap copyWith({
    String? name,
    double? version,
    List<Floor>? floors,
  }) =>
      EwuMap(
        name: name ?? this.name,
        version: version ?? this.version,
        floors: floors ?? this.floors,
      );

  factory EwuMap.fromRawJson(String str) => EwuMap.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EwuMap.fromJson(Map<String, dynamic> json) => EwuMap(
        name: json["name"],
        version: json["version"],
        floors: List<Floor>.from(json["floors"].map((x) => Floor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "version": version,
        "floors": List<dynamic>.from(floors.map((x) => x.toJson())),
      };
}
