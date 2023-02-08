import 'package:flutter/material.dart';

import '../../components/my_tile.dart';

class RowSeventeen extends StatelessWidget {
  const RowSeventeen({super.key});

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
