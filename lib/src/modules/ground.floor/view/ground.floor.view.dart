import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/floor.tile/floor.tile.dart';
import '../../home/model/ewu.model.dart';
import '../provider/ground.floor.provider.dart';

class GroundFloor extends ConsumerWidget {
  const GroundFloor({super.key, required this.floor});

  final Floor floor;

  static const String routeName = 'ground-floor';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ground Floor'),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton<RowDatum>(
              hint: const Text('From'),
              value: ref.watch(fromPd(routeName)),
              onChanged: (v) =>
                  ref.read(fromPd(routeName).notifier).update((_) => v),
              items: floor.colData
                  .expand((e) => e.rowData)
                  .map<DropdownMenuItem<RowDatum>>((RowDatum value) {
                return DropdownMenuItem<RowDatum>(
                  value: value,
                  child: Text(value.name),
                );
              }).toList(),
            ),
          ),
          const SizedBox(width: 10.0),
          DropdownButtonHideUnderline(
            child: DropdownButton<RowDatum>(
              hint: const Text('To'),
              value: ref.watch(toPd(routeName)),
              onChanged: (v) =>
                  ref.read(toPd(routeName).notifier).update((_) => v),
              items: floor.colData
                  .expand((e) => e.rowData)
                  .map<DropdownMenuItem<RowDatum>>((RowDatum value) {
                return DropdownMenuItem<RowDatum>(
                  value: value,
                  child: Text(value.name),
                );
              }).toList(),
            ),
          ),
          const SizedBox(width: 10.0),
          ElevatedButton.icon(
            onPressed: () {
              final from = ref.read(fromPd(routeName));
              final to = ref.read(toPd(routeName));
              if (from == null || to == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please select a valid from and to'),
                  ),
                );
                return;
              } else {
                debugPrint(
                    'From ${from.name} ===> To ${to.name} in $routeName');
              }
            },
            label: const Text('GO'),
            icon: const Icon(Icons.done),
          ),
          const SizedBox(width: 30.0),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              ...List.generate(
                floor.colData.length,
                (outterIdx) => Expanded(
                  child: Row(
                    children: [
                      ...List.generate(
                        floor.colData[outterIdx].rowData.length,
                        (innerIdx) => FloorTile(
                          floor.colData[outterIdx].rowData[innerIdx],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
