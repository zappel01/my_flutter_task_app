import 'package:flutter/material.dart';

class S5112 extends StatelessWidget {
  const S5112({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              'assets/images/lama.jpg',
            ),
          ),
          const SizedBox(height: 10),
          const Text('Name\n ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(' ${name}', style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 20),
          const Text('Gewicht\n ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text('${gewicht} kg', style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 20),
          const Text('Größe\n ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text('${groese} m', style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 20),
          const Text('Lieblingsessen\n',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text('${lieblingsessen}', style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

// Benutzerdefinierte Daten
String name = 'Diana das Lama';
int gewicht = 120;
String lieblingsessen = 'Gras';
String groese = '1,80';
