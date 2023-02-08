import 'package:flutter/material.dart';

import '../../components/my_tile.dart';

class RowTwo extends StatelessWidget {
  const RowTwo({super.key});

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
          // 2
          Expanded(
            flex: 1,
            child: MyGroundTile('118 & 119'),
          ),
          // 3
          Expanded(
            flex: 1,
            child: MyGroundTile('117'),
          ),
          // 4
          Expanded(
            flex: 1,
            child: MyGroundTile('116'),
          ),
          // 5
          Expanded(
            flex: 1,
            child: MyGroundTile('Washroom'),
          ),
          // 6,7,8
          Expanded(
            flex: 3,
            child: MyGroundTile('Coridor'),
          ),
          // 9
          Expanded(
            flex: 1,
            child: MyGroundTile('Stairs'),
          ),
          // 10
          Expanded(
            flex: 1,
            child: MyGroundTile('114'),
          ),
          // 11
          Expanded(
            flex: 1,
            child: MyGroundTile('113'),
          ),
          // 12
          Expanded(
            flex: 1,
            child: MyGroundTile('Girls Washroom'),
          ),
          // 13
          Expanded(
            flex: 1,
            child: MyGroundTile('Stairs'),
          ),
          // 14
          Expanded(
            flex: 1,
            child: MyGroundTile('Boys Washroom'),
          ),
          // 15
          Expanded(
            flex: 1,
            child: MyGroundTile('109'),
          ),
          // 16
          Expanded(
            flex: 1,
            child: MyGroundTile('107'),
          ),
          // 17, 18
          Expanded(
            flex: 2,
            child: MyGroundTile('Coridor'),
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
