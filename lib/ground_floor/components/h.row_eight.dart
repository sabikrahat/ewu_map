import 'package:ewu_map/components/my_tile.dart';
import 'package:flutter/material.dart';

class RowEight extends StatelessWidget {
  const RowEight({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: const [
          // 1 - 5
          Expanded(
            flex: 5,
            child: MyGroundTile('Free Space'),
          ),
          // 6 - 8
          Expanded(
            flex: 3,
            child: MyGroundTile('Coridor'),
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
            child: MyGroundTile('102'),
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
