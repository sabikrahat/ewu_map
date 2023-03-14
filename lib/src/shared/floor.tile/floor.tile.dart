import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../modules/home/model/sub.models/row.datum.dart';
import '../../modules/home/provider/home.provider.dart';
import '../../utils/extensions/extensions.dart';

class FloorTile extends ConsumerWidget {
  const FloorTile(this.rowDatum, this.floorName, {super.key});

  final RowDatum rowDatum;
  final String floorName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChecked =
        ref.watch(isCheckedRowDatumPd(FloorRowDatum(floorName, rowDatum.node)));
    return Expanded(
      flex: rowDatum.flex,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:
              isChecked ? context.theme.primaryColor : context.theme.cardColor,
          border: Border.all(
            color: context.theme.primaryColor,
          ),
        ),
        child: Text(
          rowDatum.toString(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.text.labelLarge,
        ),
      ),
    );
  }
}
