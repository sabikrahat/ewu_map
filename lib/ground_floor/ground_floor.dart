import 'package:ewu_map/components/my_tile.dart';
import 'package:ewu_map/ground_floor/components/h.row_eight.dart';
import 'package:ewu_map/ground_floor/components/r.row_eighteen.dart';
import 'package:ewu_map/ground_floor/components/o.row_fifteen.dart';
import 'package:ewu_map/ground_floor/components/e.row_five.dart';
import 'package:ewu_map/ground_floor/components/d.row_four.dart';
import 'package:ewu_map/ground_floor/components/n.row_fourteen.dart';
import 'package:ewu_map/ground_floor/components/i.row_nine.dart';
import 'package:ewu_map/ground_floor/components/s.row_ninteen.dart';
import 'package:ewu_map/ground_floor/components/q.row_seventeen.dart';
import 'package:ewu_map/ground_floor/components/p.row_sixteen.dart';
import 'package:ewu_map/ground_floor/components/m.row_thirteen.dart';
import 'package:ewu_map/ground_floor/components/c.row_three.dart';
import 'package:ewu_map/ground_floor/components/t.row_twenty.dart';
import 'package:ewu_map/ground_floor/components/u.row_twenty_one.dart';
import 'package:ewu_map/ground_floor/components/w.row_twenty_three.dart';
import 'package:ewu_map/ground_floor/components/v.row_twenty_two.dart';
import 'package:flutter/material.dart';

import 'components/k.row_eleven.dart';
import 'components/a.row_one.dart';
import 'components/g.row_seven.dart';
import 'components/f.row_six.dart';
import 'components/j.row_ten.dart';
import 'components/l.row_twelve.dart';
import 'components/b.row_two.dart';

class GroundFloor extends StatelessWidget {
  const GroundFloor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ground Floor')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  ...List.generate(20,
                      (index) => Expanded(child: MyGroundTile('${index + 1}')))
                ],
              ),
              const RowOne(),
              const RowTwo(),
              const RowThree(),
              const RowFour(),
              const RowFive(),
              const RowSix(),
              const RowSeven(),
              const RowEight(),
              const RowNine(),
              const RowTen(),
              const RowEleven(),
              const RowTwelve(),
              const RowThirteen(),
              const RowFourteen(),
              const RowFifteen(),
              const RowSixteen(),
              const RowSeventeen(),
              const RowEighteen(),
              const RowNinteen(),
              const RowTwenty(),
              const RowTwentyOne(),
              const RowTwentyTwo(),
              const RowTwentyThree(),
            ],
          ),
        ),
      ),
    );
  }
}
