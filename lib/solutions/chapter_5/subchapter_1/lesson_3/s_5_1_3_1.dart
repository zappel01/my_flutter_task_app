import 'package:flutter/material.dart';

class S5131 extends StatelessWidget {
  const S5131({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Text(
            'Hello App Akademie',
            style: TextStyle(fontFamily: 'Long', fontSize: 20),
          ),
          Text(
            'Hello App Akademie',
            style: TextStyle(fontFamily: 'Rubik', fontSize: 20),
          ),
          Text(
            'Hello App Akademie',
            style: TextStyle(fontFamily: 'Maps', fontSize: 20),
          ),
          Text(
            'Hello App Akademie',
            style: TextStyle(fontFamily: 'Bungee', fontSize: 20),
          ),
        ],
      ),
    );
  }
}
