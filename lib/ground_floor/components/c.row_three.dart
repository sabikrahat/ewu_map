import 'package:flutter/material.dart';

import '../../components/my_tile.dart';

class RowThree extends StatelessWidget {
  const RowThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: const [
          // 1
          Expanded(
            flex: 1,
            child: MyGroundTile('120'),
          ),
          // 2, 3, 4
          Expanded(
            flex: 3,
            child: MyGroundTile('MBA Department'),
          ),
          // 5, 6
          Expanded(
            flex: 2,
            child: MyGroundTile('Gate'),
          ),
          // 7, 8
          Expanded(
            flex: 2,
            child: MyGroundTile('Coridor'),
          ),
          // 9
          Expanded(
            flex: 1,
            child: MyGroundTile('Stairs'),
          ),
          // 10 - 19
          Expanded(
            flex: 10,
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
