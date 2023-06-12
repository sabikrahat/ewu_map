import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/custom.routes.dart';
import '../../floor.design/view/floor.design.dart';
import '../../setting/view/setting.view.dart';
import '../provider/home.provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await fadePush(context, const SettingView()),
        child: const Icon(Icons.settings),
      ),
    );
  }
}

class Body extends ConsumerWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(loadMapProvider).when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text(error.toString())),
          data: (data) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (data.floors.any((e) => e.floor == 0)) {
                      await fadePush(
                          context,
                          FloorDesign(
                              floor:
                                  data.floors.firstWhere((e) => e.floor == 0)));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('No data for ground floor'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                  child: const Text('Ground Floor'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (data.floors.any((e) => e.floor == 1)) {
                      await fadePush(
                          context,
                          FloorDesign(
                              floor:
                                  data.floors.firstWhere((e) => e.floor == 1)));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('No data for 1st floor'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                  child: const Text('1st Floor'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (data.floors.any((e) => e.floor == 2)) {
                      await fadePush(
                          context,
                          FloorDesign(
                              floor:
                                  data.floors.firstWhere((e) => e.floor == 2)));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('No data for 2nd floor'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                  child: const Text('2nd Floor'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (data.floors.any((e) => e.floor == 3)) {
                      await fadePush(
                          context,
                          FloorDesign(
                              floor:
                                  data.floors.firstWhere((e) => e.floor == 3)));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('No data for 3rd floor'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                  child: const Text('3rd Floor'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (data.floors.any((e) => e.floor == 4)) {
                      await fadePush(
                          context,
                          FloorDesign(
                              floor:
                                  data.floors.firstWhere((e) => e.floor == 4)));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('No data for 4th floor'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                  child: const Text('4th Floor'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (data.floors.any((e) => e.floor == 5)) {
                      await fadePush(
                          context,
                          FloorDesign(
                              floor:
                                  data.floors.firstWhere((e) => e.floor == 5)));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('No data for 5th floor'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                  child: const Text('5th Floor'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (data.floors.any((e) => e.floor == 6)) {
                      await fadePush(
                          context,
                          FloorDesign(
                              floor:
                                  data.floors.firstWhere((e) => e.floor == 6)));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('No data for 6th floor'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                  child: const Text('Department Corridor Live Trace'),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
  }
}
