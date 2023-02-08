import 'package:ewu_map/components/my_tile.dart';
import 'package:flutter/material.dart';

class RowSixteen extends StatelessWidget {
  const RowSixteen({super.key});

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
          // 6 - 19
          Expanded(
            flex: 14,
            child: MyGroundTile('Coridor'),
          ),
          // 20
          Expanded(
            flex: 1,
            child: MyGroundTile('Stairs'),
          ),
        ],
      ),
    );
  }
}
