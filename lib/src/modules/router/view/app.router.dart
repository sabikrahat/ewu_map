import 'package:flutter/material.dart' show BuildContext, Widget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

import '../../../localization/loalization.dart';
import '../../home/view/home.view.dart' show HomeView;

class AppRouter extends ConsumerWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    t = AppLocalizations.of(context);
    // Check if Auth is needed
    return const HomeView();
  }
}
