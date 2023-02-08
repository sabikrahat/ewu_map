import 'package:ewu_map/components/my_tile.dart';
import 'package:flutter/material.dart';

class RowTwentyOne extends StatelessWidget {
  const RowTwentyOne({super.key});

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
            child: MyGroundTile('Void Space'),
          ),
          // 10 - 12
          Expanded(
            flex: 3,
            child: MyGroundTile('Auditorium'),
          ),
          // 13-16
          Expanded(
            flex: 4,
            child: MyGroundTile('Coridor'),
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
