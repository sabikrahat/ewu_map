import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/dijkstra.algorithm/dijkstra.algorithm.dart';
import '../../../shared/floor.tile/floor.tile.dart';
import '../../home/model/sub.models/floor.dart';
import '../../home/model/sub.models/row.datum.dart';
import '../../home/provider/home.provider.dart';
import '../provider/ground.floor.provider.dart';

class GroundFloor extends ConsumerWidget {
  const GroundFloor({super.key, required this.floor});

  final Floor floor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ground Floor'),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton<RowDatum>(
              hint: const Text('From'),
              value: ref.watch(fromPd(groundFloor)),
              onChanged: (v) =>
                  ref.read(fromPd(groundFloor).notifier).update((_) => v),
              items:
                  floor.colData.expand((e) => e.rowData).map((RowDatum value) {
                return DropdownMenuItem<RowDatum>(
                  value: value,
                  child: Text(value.name),
                );
              }).toList(),
            ),
          ),
          const SizedBox(width: 20.0),
          DropdownButtonHideUnderline(
            child: DropdownButton<RowDatum>(
              hint: const Text('To'),
              value: ref.watch(toPd(groundFloor)),
              onChanged: (v) =>
                  ref.read(toPd(groundFloor).notifier).update((_) => v),
              items:
                  floor.colData.expand((e) => e.rowData).map((RowDatum value) {
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
              final from = ref.read(fromPd(groundFloor));
              final to = ref.read(toPd(groundFloor));
              if (from == null || to == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Please select a valid from and to')),
                );
                return;
              } else {
                debugPrint(
                    'From ${from.name} ===> To ${to.name} in $groundFloor');
                calculatePath(
                  pairsList: floor.edgeVertics,
                  floorName: groundFloor,
                  ref: ref,
                  from: from.node,
                  to: to.node,
                );
              }
            },
            label: const Text('GO'),
            icon: const Icon(Icons.done),
          ),
          const SizedBox(width: 10.0),
          ElevatedButton.icon(
            onPressed: () {
              clearDropdowns(
                list: floor.colData
                    .expand((e) => e.rowData)
                    .map((v) => v.node)
                    .toList()
                    .toSet()
                    .toList(),
                floorName: groundFloor,
                ref: ref,
              );
            },
            label: const Text('Clear'),
            icon: const Icon(Icons.clear),
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
                          groundFloor,
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
