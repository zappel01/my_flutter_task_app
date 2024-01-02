import 'package:flutter/material.dart';

class S5112 extends StatelessWidget {
  const S5112({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Image.asset(
              'assets/images/lama.jpg',
            ),
          ),
          SizedBox(height: 10),
          Text('Name\n ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(' ${name}', style: TextStyle(fontSize: 16)),
          SizedBox(height: 20),
          Text('Gewicht\n ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text('${gewicht} kg', style: TextStyle(fontSize: 16)),
          SizedBox(height: 20),
          Text('Größe\n ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text('${groese} m', style: TextStyle(fontSize: 16)),
          SizedBox(height: 20),
          Text('Lieblingsessen\n',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text('${lieblingsessen}', style: TextStyle(fontSize: 16)),
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
