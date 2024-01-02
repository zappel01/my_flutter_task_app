import 'package:flutter/material.dart';

class S5111 extends StatelessWidget {
  const S5111({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Hello World'),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
              const SizedBox(width: 20),
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ],
          ),
          const SizedBox(height: 30),
          Switch(
            value: true,
            activeColor: Colors.orange,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
