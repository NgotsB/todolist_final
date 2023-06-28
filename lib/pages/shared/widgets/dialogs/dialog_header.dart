import 'package:flutter/material.dart';

class DialogHeader extends StatelessWidget {

  final String title;
  const DialogHeader({
    required this.title,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Text(title,
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
      ),
    );
  }
}
