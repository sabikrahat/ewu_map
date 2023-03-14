import 'package:flutter/services.dart';

import '../../../utils/log/log.dart';
import '../model/ewu.model.dart';

Future<EwuMap> jsonLoad() async {
  final mapStr = await rootBundle.loadString('assets/files/ewu.json');
  log.i(mapStr);
  return EwuMap.fromRawJson(mapStr);
}
