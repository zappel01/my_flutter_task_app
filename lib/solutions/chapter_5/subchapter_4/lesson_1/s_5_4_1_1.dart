import 'package:flutter/material.dart';

class S5411 extends StatelessWidget {
  const S5411({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          try {
            throw Exception("Ich bin ein Fehler");
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Fehler: $e",
                ),
              ),
            );
          }
        },
        child: const Text("Klick mich"),
      ),
    );
  }
}
