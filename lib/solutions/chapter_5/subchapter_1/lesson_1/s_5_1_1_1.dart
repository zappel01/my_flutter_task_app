import 'package:flutter/material.dart';

class S5111 extends StatelessWidget {
  const S5111({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Aufgabe1();
  }
}

class Aufgabe1 extends StatefulWidget {
  const Aufgabe1({super.key});

  @override
  State<Aufgabe1> createState() => _Aufgabe1State();
}

bool isSwitched = false;

class _Aufgabe1State extends State<Aufgabe1> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        const Text(
          'Hello World!',
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            const SizedBox(
              width: 50,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Switch(
            activeColor: Colors.amber.shade800,
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            })
      ]),
    );
  }
}
