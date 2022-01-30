import 'package:flutter/material.dart';

import 'my_colors.dart';

class ActivatedButton extends StatelessWidget {
  final Function? increment;
  final Function? decrement;
  final String? action;

  get isIncrement => action == 'increment';

  const ActivatedButton({
    required this.action,
    this.increment,
    this.decrement,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (TextButton(
      onPressed: () {
        isIncrement ? increment!() : decrement!();
      },
      child: SizedBox.fromSize(
        size: const Size(80, 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isIncrement ? Icons.person_add : Icons.person_remove,
              color: MyColors.primaryLight2,
            ),
            const SizedBox(width: 5),
            Text(
              isIncrement ? 'Entrou' : 'Saiu',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: MyColors.primaryDark1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
    ));
  }
}
