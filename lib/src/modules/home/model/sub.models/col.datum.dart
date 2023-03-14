import 'dart:convert';

import 'row.datum.dart';

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
