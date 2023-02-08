import 'package:ewu_map/components/my_tile.dart';
import 'package:flutter/material.dart';

class RowNinteen extends StatelessWidget {
  const RowNinteen({super.key});

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
          // 6
          Expanded(
            flex: 1,
            child: MyGroundTile('Stairs'),
          ),
          // 7
          Expanded(
            flex: 1,
            child: MyGroundTile('Empty Space'),
          ),
          // 8
          Expanded(
            flex: 1,
            child: MyGroundTile('Lift'),
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
          // 13-19
          Expanded(
            flex: 7,
            child: MyGroundTile('Coridor'),
          ),
          // 20
          Expanded(
            flex: 1,
            child: MyGroundTile('Empty Space'),
          ),
        ],
      ),
    );
  }
}
