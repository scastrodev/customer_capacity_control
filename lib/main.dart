import 'package:customer_capacity_control/capacity_status.dart';
import 'package:customer_capacity_control/disabled_button.dart';
import 'package:customer_capacity_control/footer_text.dart';
import 'package:customer_capacity_control/my_colors.dart';
import 'package:customer_capacity_control/restaurant_logo.dart';
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
  int customerCapacity = 20;
  final inputController = TextEditingController(text: '20');

  int customerQuantity = 0;
  get isFull => customerQuantity >= customerCapacity;

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

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

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.topRight,
        heightFactor: 12,
        child: IconButton(
          color: MyColors.primaryLight2,
          icon: const Icon(Icons.settings, size: 35),
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Lotação máxima'),
              content: SizedBox(
                height: 86,
                child: Column(
                  children: [
                    const Text('Altere o valor da lotação máxima:'),
                    TextField(
                      controller: inputController,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () => {
                    Navigator.pop(context, 'OK'),
                    setState(() {
                      customerCapacity = int.parse(inputController.text);
                    })
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
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
            const RestaurantLogo(),
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  CapacityStatus(isFull: isFull),
                  Text(
                    '$customerQuantity',
                    style: TextStyle(
                      color: isFull ? MyColors.primaryDark1 : Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 100,
                    ),
                  ),
                  Row(
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
                ],
              ),
            ),
            const FooterText()
          ],
        ),
      ),
    ));
  }
}
