import 'package:customer_capacity_control/activated_button.dart';
import 'package:customer_capacity_control/disabled_button.dart';
import 'package:customer_capacity_control/my_colors.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: Align(
          alignment: Alignment.topRight,
          heightFactor: 13.5,
          child: IconButton(
            color: MyColors.primaryLight2,
            icon: const Icon(Icons.settings, size: 35),
            onPressed: () {},
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[MyColors.primary, MyColors.primaryLight1],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 5,
                child: Image(image: AssetImage('assets/logo.png'), width: 150),
              ),
              Expanded(
                flex: 7,
                child: Column(
                  children: [
                    Text(
                      'Entrada permitida!',
                      style: TextStyle(
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
                    Text(
                      '0',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 100,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DisabledButton(),
                          const SizedBox(width: 5),
                          ActivatedButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: Text(
                  'Siga os protocolos de segurança.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
