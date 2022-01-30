import 'package:flutter/material.dart';

import 'my_colors.dart';

class DisabledButton extends StatelessWidget {
  const DisabledButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (OutlinedButton(
      onPressed: () {},
      child: SizedBox.fromSize(
        size: const Size(70, 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Saiu',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(width: 5),
            Icon(Icons.person_remove, color: MyColors.primaryDark1),
          ],
        ),
      ),
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        side: BorderSide(width: 3, color: MyColors.primaryDark1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
    ));
  }
}
