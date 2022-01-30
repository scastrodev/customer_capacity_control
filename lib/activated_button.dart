import 'package:flutter/material.dart';

import 'my_colors.dart';

class ActivatedButton extends StatelessWidget {
  const ActivatedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (TextButton(
      onPressed: () {},
      child: SizedBox.fromSize(
        size: const Size(80, 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_add, color: MyColors.primaryLight2),
            const SizedBox(width: 5),
            Text(
              'Entrou',
              style: TextStyle(color: Colors.white),
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
