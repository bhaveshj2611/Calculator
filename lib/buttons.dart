import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons(
      {super.key,
      required this.text,
      required this.bgC,
      required this.tC,
      required this.onButtonPress});

  final String text;
  final Color bgC;
  final Color tC;
  final Function(String text) onButtonPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: ElevatedButton(
        onPressed: () {
          onButtonPress(text);
        },
        style: ElevatedButton.styleFrom(
            // padding: const EdgeInsets.all(0),
            backgroundColor: bgC,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            minimumSize: const Size(70, 70)),
        child: Text(
          text,
          style:
              TextStyle(color: tC, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
