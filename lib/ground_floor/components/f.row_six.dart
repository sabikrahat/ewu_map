import 'package:ewu_map/components/my_tile.dart';
import 'package:flutter/material.dart';

class RowSix extends StatelessWidget {
  const RowSix({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: const [
          // 1
          Expanded(
            flex: 1,
            child: MyGroundTile('121'),
          ),
          // 2
          Expanded(
            flex: 1,
            child: MyGroundTile('122 & 123'),
          ),
          // 3 - 4
          Expanded(
            flex: 2,
            child: MyGroundTile('124 & 125'),
          ),
          // 5
          Expanded(
            flex: 1,
            child: MyGroundTile('Coridor'),
          ),
          // 6 - 8
          Expanded(
            flex: 3,
            child: MyGroundTile('Lift'),
          ),
          // 9
          Expanded(
            flex: 1,
            child: MyGroundTile('Coridor'),
          ),
          // 10
          Expanded(
            flex: 1,
            child: MyGroundTile('113'),
          ),
          // 11-12
          Expanded(
            flex: 2,
            child: MyGroundTile('112'),
          ),
          // 13
          Expanded(
            flex: 1,
            child: MyGroundTile('Gate'),
          ),
          // 14
          Expanded(
            flex: 1,
            child: MyGroundTile('111'),
          ),
          // 15
          Expanded(
            flex: 1,
            child: MyGroundTile('110'),
          ),
          // 16
          Expanded(
            flex: 1,
            child: MyGroundTile('108'),
          ),
          // 17-18
          Expanded(
            flex: 2,
            child: MyGroundTile('Stairs'),
          ),
          // 19
          Expanded(
            flex: 1,
            child: MyGroundTile('Coridor'),
          ),
          // 20
          Expanded(
            flex: 1,
            child: MyGroundTile('Namaj Ghor'),
          ),
        ],
      ),
    );
  }
}
