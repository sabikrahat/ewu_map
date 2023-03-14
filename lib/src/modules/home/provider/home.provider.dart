import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/home.api.dart';

final loadMapProvider = FutureProvider((_) async => await jsonLoad());

final isCheckedRowDatumPd =
    StateProvider.autoDispose.family<bool, FloorRowDatum>((_, __) => false);

class FloorRowDatum {
  final String floorName;
  final int node;

  FloorRowDatum(this.floorName, this.node);

  // equity override
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FloorRowDatum &&
        other.floorName == floorName &&
        other.node == node;
  }

  @override
  int get hashCode => (floorName.hashCode) ^ (node.hashCode);

  //to String
  @override
  String toString() => 'Floor Name $floorName and Node: $node';
}

const String groundFloor = 'ground-floor';
const String firstFloor = 'first-floor';
const String secondFloor = 'second-floor';
const String thirdFloor = 'third-floor';
const String fourthFloor = 'fourth-floor';
const String fifthFloor = 'fifth-floor';
