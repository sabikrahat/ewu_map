import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/home.api.dart';

final loadMapProvider = FutureProvider((_) async => await jsonLoad());
