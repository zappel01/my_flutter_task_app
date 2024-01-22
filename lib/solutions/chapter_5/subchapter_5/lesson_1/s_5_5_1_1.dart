import 'package:flutter/material.dart';

class S5511 extends StatelessWidget {
  const S5511({super.key});
  @override
  Widget build(BuildContext context) {
    return const Aufgabe5511();
  }
}

class Aufgabe5511 extends StatefulWidget {
  const Aufgabe5511({super.key});

  @override
  State<Aufgabe5511> createState() => _Aufgabe5511State();
}

class _Aufgabe5511State extends State<Aufgabe5511> {
  int counter1 = 0;
  int counter2 = 0;

  Future<void> warteKurz() {
    return Future.delayed(const Duration(milliseconds: 1500));
  }

  Future<void> async1() async {
    await warteKurz();
    setState(() {
      counter1++;
    });
    print('async1');
  }

  Future<void> async2() async {
    await warteKurz();
    setState(() {
      counter2++;
    });
    print('async2');
  }

  // Future<void> async3() async {
  //   await warteKurz();
  //   setState(() {
  //     counter1--;
  //   });
  //   print('async3');
  // }

  // Future<void> async4() async {
  //   await warteKurz();
  //   setState(() {
  //     counter2--;
  //   });
  //   print('async4');
  // }

  // Future<void> async5() async {
  //   await warteKurz();
  //   setState(() {
  //     counter2 = 0;
  //     counter1 = 0;
  //   });
  //   print('async5');
  // }

  Future<void> _onButtonPressed() async {
    await Future.wait(
      [
        async1(),
        async2(),
      ],
    );
    print('Fertig');
  }

  // Future<void> _onButtonPressed2() async {
  //   await Future.wait(
  //     [
  //       async3(),
  //       async4(),
  //     ],
  //   );
  //   print('Fertig');
  // }

  // Future<void> _onButtonPressed3() async {
  //   await Future.wait(
  //     [
  //       async5(),
  //     ],
  //   );
  //   print('Fertig');
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _onButtonPressed();
            },
            child: const Text('+'),
          ),
          const SizedBox(height: 20),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          Column(
            children: [
              Text('Counter 1: $counter1'),
              Text('Counter 2: $counter2'),
            ],
          ),
          // const SizedBox(
          //  width: 20,
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     _onButtonPressed3();
          //   },
          //   child: const Text('Reset'),
          // ),
          // ],
          //  ),
          // const SizedBox(height: 20),
          // ElevatedButton(
          //   onPressed: () {
          //     _onButtonPressed2();
          //   },
          //   child: const Text('-'),
          // ),
        ],
      ),
    );
  }
}
