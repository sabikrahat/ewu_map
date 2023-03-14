import 'package:dijkstra/dijkstra.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../modules/home/provider/home.provider.dart';
import '../../utils/log/log.dart';

void calculatePath({
  required List<List<int>> pairsList,
  required String floorName,
  required WidgetRef ref,
  required int from,
  required int to,
}) {
  List output = Dijkstra.findPathFromPairsList(pairsList, from, to);

  log.i('Output: $output');

  for (int i = 0; i < output.length; i++) {
    final floorRowDatum = FloorRowDatum(floorName, output[i]);
    debugPrint(floorRowDatum.toString());
    ref
        .read(isCheckedRowDatumPd(floorRowDatum).notifier)
        .update((state) => true);
  }
}

void clearDropdowns({
  required List<int> list,
  required String floorName,
  required WidgetRef ref,
}) {
  for (int i = 0; i < list.length; i++) {
    final floorRowDatum = FloorRowDatum(floorName, list[i]);
    final s = ref.read(isCheckedRowDatumPd(floorRowDatum).notifier);
    if (s.state) s.update((_) => false);
  }
}
