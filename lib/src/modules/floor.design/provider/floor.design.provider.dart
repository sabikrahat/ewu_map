import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/model/sub.models/row.datum.dart';

final fromPd = StateProvider.autoDispose
    .family<RowDatum?, String>((ref, String floor) => null);

final toPd = StateProvider.autoDispose
    .family<RowDatum?, String>((ref, String floor) => null);
