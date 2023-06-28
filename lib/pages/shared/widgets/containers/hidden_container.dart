import 'package:flutter/material.dart';

class HiddenContainer extends StatelessWidget {
  const HiddenContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 0, height: 0);
  }
}
