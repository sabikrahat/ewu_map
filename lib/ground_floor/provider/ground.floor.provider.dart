import 'package:ewu_map/model/ewu.map.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loadMapProvider = FutureProvider((_) async {
  final mapStr = await rootBundle.loadString('assets/ewu.json');
  debugPrint(mapStr);
  return EwuMap.fromRawJson(mapStr);
});

final fromPd = StateProvider.autoDispose
    .family<RowDatum?, String>((ref, String floor) => null);

final toPd = StateProvider.autoDispose
    .family<RowDatum?, String>((ref, String floor) => null);
