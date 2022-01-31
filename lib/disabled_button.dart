import 'package:flutter/material.dart';

import 'my_colors.dart';

class DisabledButton extends StatelessWidget {
  final String buttonText;

  const DisabledButton({required this.buttonText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (TextButton(
      onPressed: null,
      child: SizedBox.fromSize(
        size: const Size(80, 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              buttonText == 'Saiu' ? Icons.person_remove : Icons.person_add,
              color: MyColors.primaryDark1,
            ),
            const SizedBox(width: 5),
            Text(
              buttonText,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 3, color: MyColors.primaryDark1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
    ));
  }
}
