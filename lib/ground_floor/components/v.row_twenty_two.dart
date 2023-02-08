import 'package:ewu_map/components/my_tile.dart';
import 'package:flutter/material.dart';

class RowTwentyTwo extends StatelessWidget {
  const RowTwentyTwo({super.key});

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
          // 9 - 16
          Expanded(
            flex: 8,
            child: MyGroundTile('Empty Space'),
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
