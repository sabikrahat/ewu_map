import 'dart:convert';

class RowDatum {
  RowDatum({
    required this.node,
    required this.name,
    required this.flex,
    required this.color,
    required this.borderTop,
    required this.borderLeft,
    required this.borderRight,
    required this.borderBottom,
  });

  final int node;
  final String name;
  final int flex;
  final String color;
  final String borderTop;
  final String borderLeft;
  final String borderRight;
  final String borderBottom;

  RowDatum copyWith({
    int? node,
    String? name,
    int? flex,
    String? color,
    String? borderTop,
    String? borderLeft,
    String? borderRight,
    String? borderBottom,
  }) =>
      RowDatum(
        node: node ?? this.node,
        name: name ?? this.name,
        flex: flex ?? this.flex,
        color: color ?? this.color,
        borderTop: borderTop ?? this.borderTop,
        borderLeft: borderLeft ?? this.borderLeft,
        borderRight: borderRight ?? this.borderRight,
        borderBottom: borderBottom ?? this.borderBottom,
      );

  factory RowDatum.fromRawJson(String str) =>
      RowDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RowDatum.fromJson(Map<String, dynamic> json) => RowDatum(
        node: json["node"],
        name: json["name"],
        flex: json["flex"],
        color: json["color"],
        borderTop: json["border-top"],
        borderLeft: json["border-left"],
        borderRight: json["border-right"],
        borderBottom: json["border-bottom"],
      );

  Map<String, dynamic> toJson() => {
        "node": node,
        "name": name,
        "flex": flex,
        "color": color,
        "border-top": borderTop,
        "border-left": borderLeft,
        "border-right": borderRight,
        "border-bottom": borderBottom,
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
