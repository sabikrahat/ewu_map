import 'package:flutter/material.dart';

class MyGroundTile extends StatelessWidget {
  const MyGroundTile(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _defineColor(text),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

Color _defineColor(String text) {
  return groundFloorsWithColor[text] ?? Colors.blue[100]!;
}

final groundFloorsWithColor = {
  'Coridor': Colors.blue,
  'Stairs': Colors.red,
  'Washroom': Colors.yellow,
  'Lift': Colors.pink,
  'Empty Space': Colors.indigo,
  'Open Courtyard': Colors.orange,
  'Gate': Colors.purple,
  'Punch Machine': Colors.green,
  'Gallery': Colors.lightGreen,
  'Study Zone': Colors.amber,
  'FUB Entry': Colors.deepOrange,
  'Wifi Zone': Colors.cyan,
  'Reception': Colors.brown,
  'Admin Access': Colors.lightBlue,
  'Auditorium': Colors.limeAccent,
  'MBA Department': Colors.teal,
  'Free Space': Colors.tealAccent,
};

List<String> ucsAlgorithm(String start, String end) => ['1', '2', '3'];
