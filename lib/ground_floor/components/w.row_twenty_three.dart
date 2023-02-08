import 'package:ewu_map/components/my_tile.dart';
import 'package:flutter/material.dart';

class RowTwentyThree extends StatelessWidget {
  const RowTwentyThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: const [
          // 1 - 8
          Expanded(
            flex: 8,
            child: MyGroundTile('Study Zone'),
          ),
          // 9
          Expanded(
            flex: 1,
            child: MyGroundTile('FUB Entry'),
          ),
          // 10
          Expanded(
            flex: 1,
            child: MyGroundTile('Empty Space'),
          ),
          // 11 - 15
          Expanded(
            flex: 5,
            child: MyGroundTile('Washroom'),
          ),
          // 16
          Expanded(
            flex: 1,
            child: MyGroundTile('Stairs'),
          ),
          // 17-18
          Expanded(
            flex: 2,
            child: MyGroundTile('Reception'),
          ),
          // 19-20
          Expanded(
            flex: 2,
            child: MyGroundTile('Punch Machine'),
          ),
        ],
      ),
    );
  }
}
