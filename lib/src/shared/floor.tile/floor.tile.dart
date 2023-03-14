import 'package:ewu_map/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../modules/home/model/ewu.model.dart';

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
          color: context.theme.cardColor,
          border: Border.all(
            color: context.theme.primaryColor,
          ),
        ),
        child: Text(
          rowDatum.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.text.labelLarge,
        ),
      ),
    );
  }
}
