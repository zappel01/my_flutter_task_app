import 'package:flutter/material.dart';

class S5312 extends StatelessWidget {
  const S5312({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.network(
      'https://i.pinimg.com/originals/d6/d3/b8/d6d3b8b49a843bd7257fdf56f442a233.jpg',
      height: 200,
      width: 200,
      fit: BoxFit.contain,
    ));
  }
}
