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
            style: TextStyle(fontFamily: 'Long', fontSize: 30),
          ),
          SizedBox(height: 16),
          Text(
            'Hello App Akademie',
            style: TextStyle(fontFamily: 'Rubik', fontSize: 30),
          ),
          SizedBox(height: 16),
          Text(
            'Hello App Akademie',
            style: TextStyle(fontFamily: 'Maps', fontSize: 30),
          ),
          SizedBox(height: 16),
          Text(
            'Hello App Akademie',
            style: TextStyle(fontFamily: 'Bungee', fontSize: 30),
          ),
        ],
      ),
    );
  }
}
