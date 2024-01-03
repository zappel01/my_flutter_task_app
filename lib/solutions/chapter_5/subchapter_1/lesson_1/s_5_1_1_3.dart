import 'package:flutter/material.dart';

class S5113 extends StatelessWidget {
  const S5113({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const CustomMaterialButton(text: 'Hello', color: Colors.blue);
  }
}

class CustomMaterialButton extends StatelessWidget {
  final String text;
  final Color color;
  final double borderRadius;
  final double height;
  final double width;

  const CustomMaterialButton({
    super.key,
    required this.text,
    required this.color,
    this.borderRadius = 20,
    this.height = 50,
    this.width = 200,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: InkWell(
        onTap: () {},
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
