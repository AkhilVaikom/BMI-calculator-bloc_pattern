import 'package:flutter/material.dart';

class HomeAppBarWidgets extends StatelessWidget {
  const HomeAppBarWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff0b0f31),
      title: const Text('BMI CALCULATOR'),
    );
  }
}
