import 'dart:convert';

import 'col.datum.dart';

class Floor {
  Floor({
    required this.name,
    required this.floor,
    required this.colData,
    required this.edgeVertics,
  });

  final int floor;
  final String name;
  final List<ColDatum> colData;
  final List<List<int>> edgeVertics;

  Floor copyWith({
    int? floor,
    String? name,
    List<ColDatum>? colData,
    List<List<int>>? edgeVertics,
  }) =>
      Floor(
        name: name ?? this.name,
        floor: floor ?? this.floor,
        colData: colData ?? this.colData,
        edgeVertics: edgeVertics ?? this.edgeVertics,
      );

  factory Floor.fromRawJson(String str) => Floor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Floor.fromJson(Map<String, dynamic> json) => Floor(
        name: json["name"],
        floor: json["floor"],
        colData: List<ColDatum>.from(
            json["colData"].map((x) => ColDatum.fromJson(x))),
        edgeVertics: List<List<int>>.from(
            json["edgeVertics"].map((x) => List<int>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "floor": floor,
        "colData": List<dynamic>.from(colData.map((x) => x.toJson())),
        "edgeVertics": List<dynamic>.from(
            edgeVertics.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}
