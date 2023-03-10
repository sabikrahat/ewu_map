import 'package:ewu_map/components/floor.tile.dart';
import 'package:ewu_map/ground_floor/components/c.row_three.dart';
import 'package:ewu_map/ground_floor/components/d.row_four.dart';
import 'package:ewu_map/ground_floor/components/e.row_five.dart';
import 'package:ewu_map/ground_floor/components/h.row_eight.dart';
import 'package:ewu_map/ground_floor/components/i.row_nine.dart';
import 'package:ewu_map/ground_floor/components/m.row_thirteen.dart';
import 'package:ewu_map/ground_floor/components/n.row_fourteen.dart';
import 'package:ewu_map/ground_floor/components/o.row_fifteen.dart';
import 'package:ewu_map/ground_floor/components/p.row_sixteen.dart';
import 'package:ewu_map/ground_floor/components/q.row_seventeen.dart';
import 'package:ewu_map/ground_floor/components/r.row_eighteen.dart';
import 'package:ewu_map/ground_floor/components/s.row_ninteen.dart';
import 'package:ewu_map/ground_floor/components/t.row_twenty.dart';
import 'package:ewu_map/ground_floor/components/u.row_twenty_one.dart';
import 'package:ewu_map/ground_floor/components/v.row_twenty_two.dart';
import 'package:ewu_map/ground_floor/components/w.row_twenty_three.dart';
import 'package:ewu_map/model/ewu.map.model.dart';
import 'package:flutter/material.dart';

import 'components/a.row_one.dart';
import 'components/b.row_two.dart';
import 'components/f.row_six.dart';
import 'components/g.row_seven.dart';
import 'components/j.row_ten.dart';
import 'components/k.row_eleven.dart';
import 'components/l.row_twelve.dart';

class GroundFloor extends StatelessWidget {
  const GroundFloor({super.key, required this.floor});

  final Floor floor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ground Floor')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: const [
              RowOne(),
              RowTwo(),
              RowThree(),
              RowFour(),
              RowFive(),
              RowSix(),
              RowSeven(),
              RowEight(),
              RowNine(),
              RowTen(),
              RowEleven(),
              RowTwelve(),
              RowThirteen(),
              RowFourteen(),
              RowFifteen(),
              RowSixteen(),
              RowSeventeen(),
              RowEighteen(),
              RowNinteen(),
              RowTwenty(),
              RowTwentyOne(),
              RowTwentyTwo(),
              RowTwentyThree(),
            ],
          ),
        ),
      ),
    );
  }
}

class GroundFloorJSON extends StatelessWidget {
  const GroundFloorJSON({super.key, required this.floor});

  final Floor floor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ground Floor')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              ...List.generate(
                floor.colData.length,
                (outterIdx) => Expanded(
                  child: Row(
                    children: [
                      ...List.generate(
                        floor.colData[outterIdx].rowData.length,
                        (innerIdx) => FloorTile(
                          floor.colData[outterIdx].rowData[innerIdx],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
