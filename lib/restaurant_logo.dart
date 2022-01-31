import 'package:flutter/material.dart';

class RestaurantLogo extends StatelessWidget {
  const RestaurantLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (const Expanded(
      flex: 5,
      child: Image(image: AssetImage('assets/logo.png'), width: 150),
    ));
  }
}
