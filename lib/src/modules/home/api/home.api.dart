import 'package:ewu_map/src/modules/home/model/sub.models/floor.dart';
import 'package:flutter/services.dart';

import '../model/ewu.model.dart';

Future<EwuMap> jsonLoad() async {
  final mapStr = await rootBundle.loadString('assets/files/ewu.json');
  // log.i(mapStr);
  return EwuMap.fromRawJson(mapStr);
}

Future<Floor> jsonFloorLoad(String path) async {
  final mapStr = await rootBundle.loadString(path);
  // log.i(mapStr);
  return Floor.fromRawJson(mapStr);
}
