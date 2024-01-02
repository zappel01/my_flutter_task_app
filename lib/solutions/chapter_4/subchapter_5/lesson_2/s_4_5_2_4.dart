import 'package:flutter/material.dart';

class ShowHideNameWidget extends StatefulWidget {
  const ShowHideNameWidget({super.key});

  @override
  State<ShowHideNameWidget> createState() => _ShowHideNameWidgetState();
}

class _ShowHideNameWidgetState extends State<ShowHideNameWidget> {
  String _name = '';
  String _buttonText = 'Name anzeigen';

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
              if (_name == '') {
                _name = 'Sven';
                _buttonText = 'Name verstecken';
              } else {
                _name = '';
                _buttonText = 'Name anzeigen';
              }
            });
          },
          child: Text(_buttonText),
        ),
      ],
    );
  }
}
