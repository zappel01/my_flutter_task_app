import 'package:flutter/material.dart';

class S4531 extends StatelessWidget {
  const S4531({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const double containersize = 100;
    return Column(
      children: [
        Container(
          height: containersize,
          width: containersize,
          color: Colors.blueGrey,
        ),
        Container(
          height: containersize,
          width: containersize,
          color: Colors.blue,
        ),
        Container(
          height: containersize,
          width: containersize,
          color: Colors.cyan,
        ),
      ],
    );
  }
}
