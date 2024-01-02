import 'package:flutter/material.dart';

class MyNameWidget extends StatefulWidget {
  const MyNameWidget({super.key});

  @override
  State<MyNameWidget> createState() => _MyNameWidgetState();
}

class _MyNameWidgetState extends State<MyNameWidget> {
  String _name = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _name,
          style: const TextStyle(fontSize: 20),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _name = 'Sven';
            });
          },
          child: const Text('Name anzeigen'),
        ),
      ],
    );
  }
}
