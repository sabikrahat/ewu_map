// To parse this JSON data, do
//
//     final ewuMap = ewuMapFromJson(jsonString);

import 'dart:convert';

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

class Floor {
  Floor({
    required this.floor,
    required this.colData,
  });

  final int floor;
  final List<ColDatum> colData;

  Floor copyWith({
    int? floor,
    List<ColDatum>? colData,
  }) =>
      Floor(
        floor: floor ?? this.floor,
        colData: colData ?? this.colData,
      );

  factory Floor.fromRawJson(String str) => Floor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Floor.fromJson(Map<String, dynamic> json) => Floor(
        floor: json["floor"],
        colData: List<ColDatum>.from(
            json["colData"].map((x) => ColDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "floor": floor,
        "colData": List<dynamic>.from(colData.map((x) => x.toJson())),
      };
}

class ColDatum {
  ColDatum({
    required this.id,
    required this.rowData,
  });

  final int id;
  final List<RowDatum> rowData;

  ColDatum copyWith({
    int? id,
    List<RowDatum>? rowData,
  }) =>
      ColDatum(
        id: id ?? this.id,
        rowData: rowData ?? this.rowData,
      );

  factory ColDatum.fromRawJson(String str) =>
      ColDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ColDatum.fromJson(Map<String, dynamic> json) => ColDatum(
        id: json["id"],
        rowData: List<RowDatum>.from(
            json["rowData"].map((x) => RowDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rowData": List<dynamic>.from(rowData.map((x) => x.toJson())),
      };
}

class RowDatum {
  RowDatum({
    required this.node,
    required this.name,
    required this.flex,
    required this.color,
  });

  final int node;
  final String name;
  final int flex;
  final String color;

  RowDatum copyWith({
    int? node,
    String? name,
    int? flex,
    String? color,
  }) =>
      RowDatum(
        node: node ?? this.node,
        name: name ?? this.name,
        flex: flex ?? this.flex,
        color: color ?? this.color,
      );

  factory RowDatum.fromRawJson(String str) =>
      RowDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RowDatum.fromJson(Map<String, dynamic> json) => RowDatum(
        node: json["node"],
        name: json["name"],
        flex: json["flex"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "node": node,
        "name": name,
        "flex": flex,
        "color": color,
      };
}
