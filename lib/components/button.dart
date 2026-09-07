import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, this.text, this.callback});

  final void Function()? callback;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback ?? () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
      ),
      child: Text(
        text ?? "Answer Placeholder",
        textAlign: TextAlign.center,
      ),
    );
  }
}
