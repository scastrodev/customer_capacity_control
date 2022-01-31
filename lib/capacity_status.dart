import 'package:flutter/material.dart';

import 'my_colors.dart';

class CapacityStatus extends StatelessWidget {
  final bool isFull;

  const CapacityStatus({Key? key, required this.isFull}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Column(children: [
      Text(
        isFull ? 'Entrada não permitida!' : 'Entrada permitida!',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 23,
          fontWeight: FontWeight.w300,
        ),
      ),
      Divider(
        height: 8,
        thickness: 2,
        indent: 130,
        endIndent: 130,
        color: MyColors.primaryLight2,
      ),
    ]));
  }
}
