import 'package:customer_capacity_control/disabled_button.dart';
import 'package:customer_capacity_control/my_colors.dart';
import 'package:flutter/material.dart';

import 'activated_button.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int customerQuantity = 0;

  void addCustomer() {
    setState(() {
      customerQuantity++;
    });
  }

  void removeCustomer() {
    setState(() {
      customerQuantity--;
    });
  }

  get isFull => customerQuantity >= 10;

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.topRight,
        heightFactor: 12,
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
              flex: 6,
              child: Column(
                children: [
                  Text(
                    isFull ? 'Entrada não permitida' : 'Entrada permitida!',
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
                  Text(
                    '$customerQuantity',
                    style: TextStyle(
                      color: isFull ? MyColors.primaryDark1 : Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customerQuantity > 0
                            ? ActivatedButton(
                                action: 'decrement',
                                decrement: removeCustomer,
                              )
                            : const DisabledButton(buttonText: 'Saiu'),
                        const SizedBox(width: 5),
                        isFull
                            ? const DisabledButton(buttonText: 'Entrou')
                            : ActivatedButton(
                                action: 'increment',
                                increment: addCustomer,
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: Text(
                'Siga os protocolos de segurança.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
