import 'package:flutter/material.dart';

class S5133 extends StatelessWidget {
  const S5133({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: StylishContainer(
        textContent: 'Hallo, dies ist ein stilvoller Container!',
      ),
    );
  }
}

class StylishContainer extends StatelessWidget {
  final String textContent;

  const StylishContainer({super.key, required this.textContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.black, // Hintergrundfarbe
        borderRadius: BorderRadius.circular(10.0), // Abgerundete Ecken
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.7), // Farbe des Schattens
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(5, 5), // Änderung der Schattenposition
          ),
        ],
      ),
      child: Text(
        textContent,
        style: const TextStyle(
          color: Colors.white, // Textfarbe
          fontSize: 18.0,
        ),
      ),
    );
  }
}
