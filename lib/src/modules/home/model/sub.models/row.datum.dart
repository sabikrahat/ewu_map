import 'dart:convert';

class RowDatum {
  RowDatum({
    required this.node,
    required this.name,
    required this.flex,
    required this.color,
    required this.border,
  });

  final int node;
  final String name;
  final int flex;
  final String color;
  final String border;

  RowDatum copyWith({
    int? node,
    String? name,
    int? flex,
    String? color,
    String? border,
  }) =>
      RowDatum(
        node: node ?? this.node,
        name: name ?? this.name,
        flex: flex ?? this.flex,
        color: color ?? this.color,
        border: border ?? this.border,
      );

  factory RowDatum.fromRawJson(String str) =>
      RowDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RowDatum.fromJson(Map<String, dynamic> json) => RowDatum(
        node: json["node"],
        name: json["name"],
        flex: json["flex"],
        color: json["color"],
        border: json["border"],
      );

  Map<String, dynamic> toJson() => {
        "node": node,
        "name": name,
        "flex": flex,
        "color": color,
        "border": border,
      };

  //toString
  @override
  String toString() => name;

//   // equity override
//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
//     return other is RowDatum && other.node == node;
//   }

//   @override
//   int get hashCode => node.hashCode;
}
