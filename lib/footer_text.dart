import 'package:flutter/material.dart';

class FooterText extends StatelessWidget {
  const FooterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (const Expanded(
      flex: 1,
      child: Text(
        'Siga os protocolos de segurança.',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
      ),
    ));
  }
}
