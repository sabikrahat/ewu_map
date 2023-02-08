import 'package:ewu_map/components/my_tile.dart';
import 'package:flutter/material.dart';

class RowFifteen extends StatelessWidget {
  const RowFifteen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: const [
          // 1 - 5
          Expanded(
            flex: 5,
            child: MyGroundTile('Gallery'),
          ),
          // 6 - 8
          Expanded(
            flex: 3,
            child: MyGroundTile('Coridor'),
          ),
          // 9
          Expanded(
            flex: 1,
            child: MyGroundTile('Wifi Zone'),
          ),
          // 10 - 18
          Expanded(
            flex: 9,
            child: MyGroundTile('Open Courtyard'),
          ),
          // 19
          Expanded(
            flex: 1,
            child: MyGroundTile('Coridor'),
          ),
          // 20
          Expanded(
            flex: 1,
            child: MyGroundTile('Admin Access'),
          ),
        ],
      ),
    );
  }
}
