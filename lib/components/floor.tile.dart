import 'package:flutter/material.dart';

import '../model/ewu.map.model.dart';

class FloorTile extends StatelessWidget {
  const FloorTile(this.rowDatum, {super.key});

  final RowDatum rowDatum;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: rowDatum.flex,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(int.parse(rowDatum.color)),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Text(
          rowDatum.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
