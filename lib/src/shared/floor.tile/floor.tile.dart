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
          color: isChecked
              ? context.theme.primaryColor.withOpacity(0.5)
              : Color(int.parse(rowDatum.color)),
          border: Border(
            top: BorderSide(
              color: Color(int.parse(rowDatum.borderTop)),
              width: 0.5,
            ),
            left: BorderSide(
              color: Color(int.parse(rowDatum.borderLeft)),
              width: 0.5,
            ),
            right: BorderSide(
              color: Color(int.parse(rowDatum.borderRight)),
              width: 0.5,
            ),
            bottom: BorderSide(
              color: Color(int.parse(rowDatum.borderBottom)),
              width: 0.5,
            ),
          ),
        ),
        child: floorName == tenthFloor
            ? Text(
                rowDatum.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.text.labelLarge!
                    .copyWith(color: context.text.titleLarge!.color),
              )
            : Text(
                rowDatum.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.text.labelLarge!
                    .copyWith(color: context.text.titleLarge!.color),
              ),
      ),
    );
  }
}
